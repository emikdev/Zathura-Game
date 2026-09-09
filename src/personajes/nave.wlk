class Nave {

    var property image  
    var property position 
    var balas
    var vida

    method mover(direccion){

		const nuevaPosition = direccion.siguiente(position)
		position = nuevaPosition

	}

    method disparar(bala){

        balas -= 1
        bala.dispara()

    }

    method curarNave(curacion){

        vida = curacion.curar()

    }

}