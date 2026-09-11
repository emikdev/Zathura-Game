import game.*
import src.mecanicas.direcciones.*

class Nave {

    var property image  
    var property position 
    var property vida = 3 
    var frameNave = ["nave.png", "Nave.png", "naveDisparando-frame1.png", "naveDisparando-frame2.png"]


    method mover(direccion){
		const nuevaPosition = direccion.siguiente(position)
		position = nuevaPosition
	}

    method disparar(arma){
        arma.dispara()

    }

    method animacionDisparo(){
        // forEach
    }
}

const naveDefault = new Nave( image = "naves/naves.png", position = game.origin())