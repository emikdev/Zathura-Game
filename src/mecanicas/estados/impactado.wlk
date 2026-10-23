import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.neutral.*

class Impactado inherits EstadoPersonaje {

    method initialize(){
        const animacion = personaje.animacionImpacto()
    }

    override method mover(direccion){ }

    method perderVida(){

        personaje.perderVida()
        game.removeVisual(personaje)

    }

    method intentarReaparecer(){

        if (personaje.vidas() > 0){ 
            
            personaje.position(game.at(0, (game.width()/2)))
            self.cambiarANeutral()
            game.addVisual(personaje)

        }

    }

    override method cambiarANeutral(){
        personaje.cambiarEstado(new Neutral(personaje = personaje))
    }

}