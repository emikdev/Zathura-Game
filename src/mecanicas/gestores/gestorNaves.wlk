import gestorNiveles.*

object gestorNaves {
  
    const naves = [] // Naves que son usadas por el gestor

    method agregarNave(nuevaNave){ // Agrega naves al gestor
        naves.add(nuevaNave)
    }

    method eliminarNaveSinVidas(naveEliminada){ // Elimina la nave pasada por parametro de la lista de naves
        naves.remove(naveEliminada)

        if(naves.isEmpty()){ // Si no queda naves en la lista de naves se llama al game over
            gestorNiveles.gameOver()
        }
    }
}