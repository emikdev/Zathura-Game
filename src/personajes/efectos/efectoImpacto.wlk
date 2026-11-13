import src.personajes.efectos.efectosPersonaje.*
import src.menu.efectos.*
class EfectoImpacto inherits EfectoVisual {

    override method initialize() {
        super()
        efectos.reproducir("impacto.mp3") // Sonido correspondiente al efecto
    }

    override method recursoAnimacion() = personaje.animacionImpacto()

    override method terminoAnimacion() {
        personaje.cambiarEfecto(sinEfecto)
    }

}