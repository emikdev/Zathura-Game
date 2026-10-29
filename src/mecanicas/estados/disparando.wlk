import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.neutral.*

class Disparando inherits EstadoPersonaje {

    override method initialize(){
        super()
        personaje.arsenal().armaActual().disparar(personaje)
        personaje.arsenal().verificarArmaActual()
    }

    override method recursoAnimacion() = personaje.animacionDisparo()

    override method terminoAnimacion() {
        self.cambiarANeutral()
    }
    
    override method disparar(){ }

}