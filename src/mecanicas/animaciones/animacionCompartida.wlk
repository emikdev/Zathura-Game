import wollok.game.*

// Único reloj global compartido para todos los disparos
object relojAnimaciones {
    const animaciones = []
    const intervaloBase = 50 // Se ejecuta cada 50 ms sin generar lag
    var corriendo = false

    method iniciar() {
        if (not corriendo) {
            corriendo = true
            self.ciclo()
        }
    }

    method ciclo() {
        game.schedule(intervaloBase, {
            if (corriendo) {
                animaciones.copy().forEach({ animacion =>
                    animacion.avanzarTiempo(intervaloBase)
                })
                self.ciclo()
            }
        })
    }

    method registrar(animacion) {
        if (not animaciones.contains(animacion)) {
            animaciones.add(animacion)
        }
        self.iniciar()
    }

    method quitar(animacion) {
        animaciones.remove(animacion)
    }

    method detener() {
        corriendo = false
        animaciones.clear()
    }
}

// Clase usada exclusivamente por los disparos
class AnimacionCompartida {
    const estado
    const recursoDeAnimacion
    var frameActual = 0
    var tiempoAcumulado = 0
    var activa = true

    method activa() = activa

    method initialize() {
        relojAnimaciones.registrar(self)
    }

    method frameActual() = recursoDeAnimacion.frames().get(frameActual)

    method tiempoPorFrame() {
        return recursoDeAnimacion.duracion() / recursoDeAnimacion.frames().size()
    }

    method avanzarTiempo(ms) {
        if (activa) {
            tiempoAcumulado += ms
            if (tiempoAcumulado >= self.tiempoPorFrame()) {
                tiempoAcumulado = 0
                self.siguienteFrame()
            }
        }
    }

    method siguienteFrame() {
        if (frameActual < (recursoDeAnimacion.frames().size() - 1)) {
            frameActual += 1
        } else {
            estado.terminoAnimacion()
        }
    }

    method reiniciar() {
        frameActual = 0
        tiempoAcumulado = 0
        activa = true
        relojAnimaciones.registrar(self)
    }

    method detener() {
        activa = false
        relojAnimaciones.quitar(self)
    }
}
