import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.animacion.*

class EstadoPersonaje {

	const personaje
	var animacion

	method initialize() {
        animacion = new Animacion(estado = self, recursoDeAnimacion = self.recursoAnimacion())
    }

    method recursoAnimacion()
    method terminoAnimacion()

	method imagenActual(){
		return animacion.frameActual()
	}

    method finalizarAnimacion() {
        animacion.detener()
    }

	method mover(direccion){
		personaje.position(direccion.siguiente(personaje.position())) 
	}

	method cambiarANeutral()
	method disparar()
	method recibirImpacto()
	    
}
