import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.neutral.*

class Impactado inherits EstadoPersonaje {

    override method mover(personaje, direccion){ }

    override method perderVida(personaje){

        personaje.perderVida()
        game.removeVisual(personaje)

    }

    method intentarReaparecer(personaje){

        if (personaje.vidas() > 0){ 
            
            personaje.position(game.at(0, (game.width()/2)))
            personaje.cambiarEstado(new Neutral(animacion = personaje.animacionBase()))
            game.addVisual(personaje)

        }

    }

}