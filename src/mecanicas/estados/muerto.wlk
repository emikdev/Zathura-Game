
import src.mecanicas.estados.estado.*

object muerto inherits Estado {

    override method frames(nave) = nave.framesMuerte()   // trae los frames del estado muerto para poder correr su animacion, los trae del atributo de la nave
    override method duracionFrame() = 150
    override method estaMuerta() = true
    override method alTerminar(nave) { nave.animarMuerte() }
}