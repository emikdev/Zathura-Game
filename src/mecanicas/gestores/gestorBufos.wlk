import wollok.game.*
import src.menu.configuracion.*
import src.buf.buf.*
import src.buf.tiposDeBufos.*
import src.mecanicas.animaciones.recursos.recursosBufos.*

object gestorBufos {
    const bufosActivos = []

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
        const xAleatoria = 0.randomUpTo(game.width()).truncate(0)
        const posInicial = game.at(xAleatoria, game.height() - 1)
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

    // Genera un bufo de arma aleatorio en la posición dada
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

    // Método exclusivo para soltar el bufo de vida al destruir un ovni
    method generarBufoVidaEn(posicion) {
        const nuevoBufo = new BufoVida(
            position = posicion,
            recursoAnimacion = bufoVidaRecursos
        )
        nuevoBufo.iniciar()
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
        bufosActivos.copy().forEach({ bufo => bufo.desaparecer() })
    }
}
