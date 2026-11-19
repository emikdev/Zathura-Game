import wollok.game.*

import src.personajes.personaje.*
import src.gestores.gestorNaves.*


class NaveJugador inherits Personaje {
    
    override method iniciar(){
        game.addVisual(self)
    }

    method iconoArmaActual() = arsenal.armaActual().iconoHud()
    method municionActual() = arsenal.armaActual().municion()
    
    method vidas(){
        return vidas
    }

    override method alQuedarseSinVidas() {
        gestorNaves.eliminarNaveSinVidas(self)
    }

}