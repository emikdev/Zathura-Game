import wollok.game.*
import src.personajes.factory.factory.*

object gestorMuros {

    var muros = []
    const posiciones = [game.at(2, 3), game.at(7, 3), game.at(12, 3), game.at(17, 3)]

    method iniciar(dificultad) {
        self.detener()   // por si quedaron muros de un nivel anterior
        muros = posiciones.map({ p => factory.crearMuro(dificultad, p) })
        muros.forEach({ m => m.iniciar() })   // el muro se agrega al tablero y registra su colisión
    }

    method muroDestruido(muro) {
        muros.remove(muro)
        muro.retirar()
        // Ejecutar sonido
    }

    // Retira todos los muros que sigan en pie (fin de nivel)
    method detener() {
        muros.forEach({ m => m.retirar() })
        muros.clear()
    }

    method cantidadActivos() = muros.size()

}