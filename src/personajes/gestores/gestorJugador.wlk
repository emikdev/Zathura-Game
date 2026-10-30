import gestorPersonajes.*
import src.niveles.gestorDeNivel.gestorDeNiveles

object gestorJugador inherits Gestor{

    const naves = [] // Naves que son usadas por el gestor

    method agregarNaves(navesAgregadas){ // Agrega naves al gestor
        naves.addAll(naves)
    }

    method eliminarNaveSinVidas(naveEliminada){ // Elimina la nave pasada por parametro de la lista de naves
        naves.remove(naveEliminada)

        if(naves.isEmpty()){ // Si no queda naves en la lista de naves se llama al game over
            gestorDeNiveles.gameOver()
        }
    }
}