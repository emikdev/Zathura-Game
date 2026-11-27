import src.personajes.efectos.efectosPersonaje.*
import src.sonidos.sonido.*

class EfectoImpacto inherits EfectoVisual {
    override method initialize() {
        super()
        sonido.reproducir("impacto.mp3")
    }

    override method recursoAnimacion() = personaje.animacionImpacto()

    override method terminoAnimacion() {
        self.terminar() // Le dice al efecto que termine, y este le avisa al personaje
    }
}