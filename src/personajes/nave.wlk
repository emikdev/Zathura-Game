import game.*
import src.mecanicas.direcciones.*

class Nave {

    var property image  
    var property position 

    method mover(direccion){
		const nuevaPosition = direccion.siguiente(position)
		position = nuevaPosition

	}

    method disparar(arma){
        arma.dispara()

    }

    // method muerte(){
    //     self.image("explosion.png")       
    //     self.error("Has sido destruido")
    // }

}

const naveDefault = new Nave( image = "nave/naveClasica.png", position = game.origin())