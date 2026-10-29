import src.personajes.estados.estadoPersonaje.*
import src.personajes.estados.neutral.*

class Disparando inherits EstadoPersonaje {

    override method initialize(){
        super()
        personaje.armaActual().disparar(personaje)
    }

    override method recursoAnimacion() = personaje.animacionDisparo()

    override method terminoAnimacion() {
        self.cambiarANeutral()
    }
    
    override method disparar(){ }

}