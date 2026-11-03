import src.personajes.estados.estadoPersonaje.*
import src.personajes.estados.disparando.*
class Neutral inherits EstadoPersonaje {

    override method recursoAnimacion() = personaje.animacionBase()

    override method terminoAnimacion() {
        animacion.reiniciar()   // Mantiene en loop por que es la animacion base.
    }

    override method cambiarANeutral(){ }

}