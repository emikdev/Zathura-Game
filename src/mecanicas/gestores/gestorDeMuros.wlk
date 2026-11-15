import wollok.game.*
import src.personajes.factory.factory.*

object gestorMuros{
    
    var muros = []
    const posiciones = [game.at(2, 4), game.at(game.center(), 4), game.at(17, 4)]
    method iniciar(){
        muros = posiciones.map({p => factory.crearMuro(0, p)})
    }

    method muroDestruido(muro){
        muros.remove(muro)
        // Ejecutar sonido, tambien podriamos bajar el puntaje
    }

}