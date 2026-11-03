import src.personajes.personaje.*
import src.mecanicas.gestores.gestorNaves.*
import wollok.game.*

class NaveJugador inherits Personaje {
    
    override method iniciar(){
        game.addVisual(self)
    }

    override method alQuedarseSinVidas() {
        gestorNaves.eliminarNaveSinVidas(self)
    }

}