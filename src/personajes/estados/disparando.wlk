import src.personajes.estados.estadoPersonaje.*
import src.personajes.estados.neutral.*
import sonidos.sonido.*

class Disparando inherits EstadoPersonaje {

    override method initialize(){
        super()
        sonido.reproducir("disparo2.mp3")
        personaje.arsenal().armaActual().disparar(personaje)
        personaje.arsenal().verificarArmaActual()
    }

    override method recursoAnimacion() = personaje.animacionDisparo()

    override method terminoAnimacion() {
        self.cambiarANeutral()
    }
    
    override method disparar(){ }
    override method seleccionarArma(slot){ }

}