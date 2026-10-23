import src.mecanicas.direcciones.*

class EstadoPersonaje {

	const personaje

	method mover(direccion){
		personaje.position(direccion.siguiente(personaje.position())) 
	}

	method cambiarANeutral(){ }

	method disparar(){ }

	method recibirImpacto(){ }
	    
}
