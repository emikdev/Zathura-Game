import wollok.game.*

object gestorAnimaciones {
    const animaciones = []
    const intervaloBase = 50 // Único reloj global cada 50 ms (20 FPS fluidos sin lag)
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
                // Usamos .copy() porque algunas animaciones se detienen o reinician al terminar
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
        // Se auto-inicia si aún no estaba corriendo
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
