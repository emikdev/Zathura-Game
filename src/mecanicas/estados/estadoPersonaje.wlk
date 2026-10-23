import src.mecanicas.direcciones.*

class EstadoPersonaje {
  
  	// lo que cambia en cada estado
	const animacion

	method mover(personaje, direccion){
		personaje.position(direccion.siguiente(personaje.position())) 
	}

	method disparar(armaActual){ }

	method perderVida(personaje){ }
	    
}
