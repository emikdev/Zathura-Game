import wollok.game.*
import src.menu.configuracion.*
import src.buf.buf.*
import src.buf.tiposDeBufos.*
import src.mecanicas.animaciones.recursos.recursosBufos.*
import src.mecanicas.bandos.*

object gestorBufos {
    const bufosActivos = []
    var enJuego = false

    var idEscudo = 0
    var idBloqueo = 0

    method activarEscudoTemporal(duracionMs) {
        idEscudo += 1
        const idActual = idEscudo
        jugador.activarEscudo()

        game.schedule(duracionMs, {
            if (idEscudo == idActual) {
                jugador.desactivarEscudo()
            }
        })
    }

    method activarBloqueoTemporal(duracionMs) {
        idBloqueo += 1
        const idActual = idBloqueo
        enemigo.activarBloqueo()

        game.schedule(duracionMs, {
            if (idBloqueo == idActual) {
                enemigo.desactivarBloqueo()
            }
        })
    }

    method iniciar() {
        enJuego = true
    }

    method probabilidadDropActual(probabilidadBase) {
        const penalizacionDificultad = (configuracion.dificultad() - 2) * 5
        const penalizacionJugadores = (configuracion.cantidadJugadores() - 1) * 8
        
        return (probabilidadBase - penalizacionDificultad - penalizacionJugadores).max(5)
    }

    method generarBufoEn(posicion) {
        if (enJuego) {
            const creadorElegido = tiposDeBufos.anyOne()
            const nuevoBufo = creadorElegido.apply(posicion)
            nuevoBufo.iniciar()
        }
    }

    method intentarSoltarBufoEn(posicion, probabilidadBase) {
        if (enJuego && 0.randomUpTo(100) < self.probabilidadDropActual(probabilidadBase)) {
            self.generarBufoEn(posicion)
        }
    }

    method registrar(bufo) {
        bufosActivos.add(bufo)
    }

    method quitar(bufo) {
        bufosActivos.remove(bufo)
    }

    method detener() {
        enJuego = false
        idEscudo += 1
        idBloqueo += 1
        jugador.desactivarEscudo()
        enemigo.desactivarBloqueo()
        bufosActivos.copy().forEach({ bufo => bufo.desaparecer() })
        bufosActivos.clear()
    }
}
