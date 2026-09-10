import game.*
import src.mecanicas.direcciones.*

class Nave {

    var property image  
    var property position 
    var vida

    method mover(direccion){
        self.sigueVivo()
		const nuevaPosition = direccion.siguiente(position)
		position = nuevaPosition

	}

    method disparar(arma){
        self.sigueVivo()
        arma.dispara()

    }

    method sigueVivo(){
        if(vida <= 0){
            self.error("Has sido destruido")
            self.image("explosion.png")       
        }
    }

    method recibirDaño(){
        vida -=1
    }

    method curarNave(curacion){
        self.sigueVivo()
        vida += curacion.curar()
        if(vida > 100){vida = 100}

    }

}

const naveDefault = new Nave( image = "nave/naveClasica.png", position = game.origin(), vida = 100)