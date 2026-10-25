import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.disparando.*
import src.mecanicas.estados.impactado.*
class Neutral inherits EstadoPersonaje {

    override method recursoAnimacion() = personaje.animacionBase()

    override method terminoAnimacion() {
        animacion.reiniciar()   // Mantiene en loop por que es la animacion base.
    }

    override method cambiarANeutral(){ }

    override method disparar() {
        personaje.cambiarEstado(new Disparando(personaje = personaje))
    }

    override method recibirImpacto() {
        personaje.cambiarEstado(new Impactado(personaje = personaje))
    }

}