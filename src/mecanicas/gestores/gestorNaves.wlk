import gestorNiveles.*
import src.mecanicas.controles.*
import wollok.game.*

object gestorNaves {
  
    const naves = [] // Naves que son usadas por el gestor
    const controles = [controlesNave1, controlesNave2]

    method iniciar(){
        naves.forEach({ n => n.iniciar()})
    }

    method agregarNave(nuevaNave){ // Agrega naves al gestor
        naves.add(nuevaNave)
        controles.get(naves.size() - 1).asignarA(nuevaNave)
    }

    method eliminarNaveSinVidas(naveEliminada){ // Elimina la nave pasada por parametro de la lista de naves
        naves.remove(naveEliminada)

        if(naves.isEmpty()){ // Si no queda naves en la lista de naves se llama al game over
            gestorNiveles.gameOver()
        }
    }
}
