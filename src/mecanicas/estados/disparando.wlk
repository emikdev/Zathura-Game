import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.impactado.*
import src.mecanicas.estados.neutral.*

class Disparando inherits EstadoPersonaje {

    method initialize(){
        const animacion = personaje.animacionDisparo()
    }

    override method cambiarANeutral(){
        personaje.cambiarEstado(new Neutral(personaje = personaje))
    }

    override method recibirImpacto(){
        personaje.cambiarEstado(new Impactado(personaje = personaje))
    }

}