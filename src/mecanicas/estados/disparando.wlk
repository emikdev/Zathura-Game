import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.impactado.*
import src.mecanicas.estados.neutral.*

class Disparando inherits EstadoPersonaje {

    override method initialize(){
        super()
        personaje.armaActual().disparar()
    }

    override method recursoAnimacion() = personaje.animacionDisparo()

    override method terminoAnimacion() {
        self.cambiarANeutral()
    }

    override method cambiarANeutral(){
        personaje.cambiarEstado(new Neutral(personaje = personaje))
    }

    override method disparar(){ }

    override method recibirImpacto(){
        personaje.cambiarEstado(new Impactado(personaje = personaje))
    }

}