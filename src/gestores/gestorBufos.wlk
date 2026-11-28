import wollok.game.*
import src.menu.configuracion.*
import src.buf.buf.*
import src.buf.tiposDeBufos.*
import src.mecanicas.animaciones.recursos.recursosBufos.*
// import src.mecanicas.direcciones.* // Importá las direcciones para poder generar bufos en posiciones aleatorias
import src.mecanicas.bandos.bandoJugador.* // Importá jugador y enemigo
import src.mecanicas.bandos.bandoEnemigo.* // Importá jugador y enemigo

object gestorBufos {
    const bufosActivos = []

    // Dentro de object gestorBufos:
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
    /*
    // Generación automática por tiempo (Desactivada - Descomentar para usar)

    const nombreEventoSpawn = "generadorDeBufos"
    var activo = false

    // Intervalo según dificultad y cantidad de jugadores:
    // Dificultad   1 Jugador               2 Jugadores
    // Easy (1)     8 segundos (8000 ms)    12 segundos (12000 ms)
    // Normal (2)   9,5 segundos (9500 ms)  13,5 segundos (13500 ms)
    // Hard (3)     11 segundos (11000 ms)  15 segundos (15000 ms)
    method intervaloActual() {
        const extraPorDificultad = configuracion.dificultad() * 1500
        const extraPorJugadores = (configuracion.cantidadJugadores() - 1) * 2500
        
        return (5000 + extraPorDificultad + extraPorJugadores).min(20000)
    }

      method generarBufoAleatorio() {
        const xAleatoria = tablero.columnaMinima().randomUpTo(tablero.columnaMaxima() + 1).truncate(0)
        const posInicial = game.at(xAleatoria, tablero.filaMaxima())
        self.generarBufoEn(posInicial)
    }

    */

    method iniciar() {
        // Descomentar este bloque si querés reactivar la caída aleatoria desde arriba:
        /*
        if (not activo) {
            activo = true
            game.onTick(self.intervaloActual(), nombreEventoSpawn, {
                self.generarBufoAleatorio()
            })
        }
       */
    }

    // Calcula la probabilidad final combinando la probabilidad base del enemigo,
    // la dificultad elegida y la cantidad de jugadores (mínimo 5%)
    method probabilidadDropActual(probabilidadBase) {
        const penalizacionDificultad = (configuracion.dificultad() - 2) * 5
        const penalizacionJugadores = (configuracion.cantidadJugadores() - 1) * 8
        
        return (probabilidadBase - penalizacionDificultad - penalizacionJugadores).max(5)
    }

    // Genera un bufo de aleatorio en la posición dada
    method generarBufoEn(posicion) {
        const creadorElegido = tiposDeBufos.anyOne()
        const nuevoBufo = creadorElegido.apply(posicion)
        nuevoBufo.iniciar()
    }

    // Método llamado por los enemigos al morir usando su probabilidad integrada
    method intentarSoltarBufoEn(posicion, probabilidadBase) {
        if (0.randomUpTo(100) < self.probabilidadDropActual(probabilidadBase)) {
            self.generarBufoEn(posicion)
        }
    }

    method registrar(bufo) {
        bufosActivos.add(bufo)
    }

    method quitar(bufo) {
        bufosActivos.remove(bufo)
    }

    // Limpia todos los bufos activos en pantalla al terminar nivel o en Game Over
    method detener() {
        // Descomentar este bloque si reactivás la caída aleatoria desde arriba:
        /*
        if (activo) {
            game.removeTickEvent(nombreEventoSpawn)
            activo = false
        }
        */
        idEscudo += 1
        idBloqueo += 1
        jugador.desactivarEscudo()
        enemigo.desactivarBloqueo()
        bufosActivos.copy().forEach({ bufo => bufo.desaparecer() })
    }
}
