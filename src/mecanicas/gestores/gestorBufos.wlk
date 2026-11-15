import wollok.game.*
import src.menu.configuracion.* // Importamos configuracion
import src.buf.buf.*
import src.buf.tiposDeBufos.*

object gestorBufos {
    const bufosActivos = []
    const nombreEventoSpawn = "generadorDeBufos"
    var activo = false

    // Intervalo según dificultad:
    // A mayor dificultad (o más jugadores):

        // Dificultad	1 Jugador	                2 Jugadores
        // Easy (1)	    8 segundos (8000 ms)	    12 segundos (12000 ms)
        // Normal (2)	9,5 segundos (9500 ms)	    13,5 segundos (13500 ms)
        // Hard (3)	    11 segundos (11000 ms)	    15 segundos (15000 ms)

    method intervaloActual() {
        const extraPorDificultad = configuracion.dificultad() * 1500
        const extraPorJugadores = (configuracion.cantidadJugadores() - 1) * 2500
        
        return (5000 + extraPorDificultad + extraPorJugadores).min(20000)
    }


    // Probabilidad de drop de enemigos según dificultad:
    /*
        Dificultad	1 Jugador	2 Jugadores
        Easy (1)	    30%	        17%
        Normal (2)	    25%	        12%
        Hard (3)	    20%	        7%
    */
    method probabilidadDropActual() {
        const penalizacionDificultad = configuracion.dificultad() * 5
        const penalizacionJugadores = (configuracion.cantidadJugadores() - 1) * 8
        
        return (40 - penalizacionDificultad - penalizacionJugadores).max(5)
    }


    method iniciar() {
        if (not activo) {
            activo = true
            game.onTick(self.intervaloActual(), nombreEventoSpawn, {
                self.generarBufoAleatorio()
            })
        }
    }

    method generarBufoAleatorio() {
        const xAleatoria = 0.randomUpTo(game.width()).truncate(0)
        const posInicial = game.at(xAleatoria, game.height() - 1)
        self.generarBufoEn(posInicial)
    }

    method generarBufoEn(posicion) {
        const creadorElegido = tiposDeBufos.anyOne()
        const nuevoBufo = creadorElegido.apply(posicion)
        nuevoBufo.iniciar()
    }


    method intentarSoltarBufoEn(posicion) {
        if (0.randomUpTo(100) < self.probabilidadDropActual()) {
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
        if (activo) {
            game.removeTickEvent(nombreEventoSpawn)
            activo = false
        }
        bufosActivos.copy().forEach({ bufo => bufo.desaparecer() })
    }
}
