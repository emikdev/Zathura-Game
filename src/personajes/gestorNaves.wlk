import src.niveles.gestorDeNivel.gestorDeNiveles

object gestorNaves {
  
    const naves = [] // Naves que son usadas por el gestor

    method agregarNave(navesAgregadas){ // Agrega naves al gestor
        naves.add(naves)
    }

    method eliminarNaveSinVidas(naveEliminada){ // Elimina la nave pasada por parametro de la lista de naves
        naves.remove(naveEliminada)

        if(naves.isEmpty()){ // Si no queda naves en la lista de naves se llama al game over
            gestorDeNiveles.gameOver()
        }
    }
}