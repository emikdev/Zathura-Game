import src.personajes.personaje.*
import src.personajes.gestorNaves.*

class NaveJugador inherits Personaje {

    override method initialize(){
        super()
        gestorNaves.agregarNave(self)
    }

    override method alQuedarseSinVidas() {
        gestorNaves.eliminarNaveSinVidas(self)
    }

}