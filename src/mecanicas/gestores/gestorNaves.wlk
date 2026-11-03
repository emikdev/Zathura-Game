import gestorNiveles.*
import src.mecanicas.controles.*
import src.menu.configuracion.*
import wollok.game.*

object gestorNaves {
  
    const naves = configuracion.listaDeNaves()
    const controles = [controlesNave1, controlesNave2]

    method iniciar(){
        (0 .. naves.size() - 1).forEach({ i => 
            const control = controles.get(i)
            const nave = naves.get(i)
            
            control.asignarA(nave)
            nave.iniciar()
        })

    }


    method eliminarNaveSinVidas(naveEliminada){ // Elimina la nave pasada por parametro de la lista de naves
        naves.remove(naveEliminada)

        if(naves.isEmpty()){ // Si no queda naves en la lista de naves se llama al game over
            gestorNiveles.gameOver()
        }
    }
}
