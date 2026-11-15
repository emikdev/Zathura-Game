import wollok.game.*
import src.personajes.factory.factory.*

object gestorMuros{
    // , game.at(game.center(), 4), game.at(17, 4)
    var muros = []
    const posiciones = [game.at(2, 4)]
    method iniciar(){
        muros = posiciones.map({p => factory.crearMuro(0, p)})
        muros.forEach({m => game.addVisual(m)})
    }

    method muroDestruido(muro){
        game.removeVisual(muro)
        // Ejecutar sonido, tambien podriamos bajar el puntaje
    }

}