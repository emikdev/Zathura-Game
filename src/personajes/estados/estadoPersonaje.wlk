import src.mecanicas.direcciones.direcciones.*
import src.mecanicas.animaciones.animacion.*
import src.personajes.estados.neutral.*
import src.personajes.estados.disparando.*
import src.personajes.estados.muriendo.*
import src.personajes.efectos.efectoImpacto.*

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

	method cambiarANeutral(){
		personaje.cambiarEstado(new Neutral(personaje = personaje))
	}

	method disparar() {
        personaje.cambiarEstado(new Disparando(personaje = personaje))
    }

	method recibirImpacto(dano){

		personaje.restarSalud(dano)

		if (personaje.sinSalud()) {

			personaje.cambiarEstado(new Muriendo(personaje = personaje))

		} else {

			 personaje.cambiarEfecto(new EfectoImpacto(personaje = personaje))

		}

	}

	method siguienteArma(){ 
		personaje.arsenal().equiparSiguienteArma()
	}

	method seleccionarArma(slot){
		personaje.equiparArma(slot)
	}
	    
}
