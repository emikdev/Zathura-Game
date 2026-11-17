import src.personajes.personaje.*
import src.mecanicas.gestores.gestorNaves.*
import wollok.game.*

class NaveJugador inherits Personaje {
    method escudoActivo() = bando.escudoActivo()
    
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

    override method recibirImpactoDe(disparo) {
        if (!bando.escudoActivo()) { // verifica si el escudo esta activo antes de recibir el impacto
            super(disparo)
        }
    }
}