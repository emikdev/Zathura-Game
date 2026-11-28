import src.personajes.estados.estadoPersonaje.*
import src.personajes.estados.neutral.*
import src.gestores.reloj.*

class Disparando inherits EstadoPersonaje {
    override method initialize(){
        super()
        personaje.arsenal().armaActual().disparar(personaje)
        personaje.arsenal().verificarArmaActual()
    }

    override method recursoAnimacion() = personaje.animacionDisparo()
    
    /* Si el recurso de animación tiene 1 solo frame, queremos que la animación 
     "avance" (termine) por tiempo para que llame a terminoAnimacion. */
    override method autoAvanceAnimacion() = true

    override method terminoAnimacion() {
        self.cambiarANeutral()
    }
    
    override method disparar(){ }
    override method seleccionarArma(slot){ }
}