import src.personajes.personaje.*
import src.gestores.gestorNaves.*
import src.personajes.estados.neutral.*
import wollok.game.*

class NaveJugador inherits Personaje {
    method escudoActivo() = bando.escudoActivo()
    
    override method iniciar(){
        game.addVisual(self)
    }

    method restaurarParaNuevoNivel() {
        // Vuelve a la posición inicial
        self.position(self.posicionInicial())
        
        // Vuelve al estado Neutral (revive la animación)
        self.cambiarEstado(new Neutral(personaje = self))
        
        // Se restaura la salud de la nave (No las vidas)
        self.restaurarSalud()

        // Vuelve a poner la nave en el tablero
        self.iniciar()
    }

    method iconoArmaActual() = arsenal.armaActual().iconoHud()
    method municionActual() = arsenal.armaActual().municion()
    method vidas() = vidas

    override method alQuedarseSinVidas() {
        gestorNaves.eliminarNaveSinVidas(self)
    }

    override method recibirImpactoDe(disparo) {
        if (!bando.escudoActivo()) { // verifica si el escudo esta activo antes de recibir el impacto
            super(disparo)
        }
    }
}