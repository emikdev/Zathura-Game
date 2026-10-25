import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.neutral.*

class Impactado inherits EstadoPersonaje {

    override method initialize(){
        super()
        personaje.perderVida()
        self.intentarReaparecer()
    }

    override method recursoAnimacion(){ 
        return personaje.animacionImpacto()
    }

    override method terminoAnimacion() {
        game.removeVisual(personaje)
    }

    method intentarReaparecer(){
        if (personaje.vidas() > 0){ 

            personaje.position(game.at(0, (game.width()/2)))
            self.cambiarANeutral()
            game.addVisual(personaje)
            
        }
    }

    override method mover(direccion){ }

    override method cambiarANeutral(){
        personaje.cambiarEstado(new Neutral(personaje = personaje))
    }

    override method disparar(){ }

    override method recibirImpacto(){ }

}