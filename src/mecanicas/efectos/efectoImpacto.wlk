import src.mecanicas.efectos.efectosPersonaje.*
class EfectoImpacto inherits EfectoVisual {

    override method initialize() {
        super()
        game.sound("impacto.wav").play() // Sonido correspondiente al efecto
    }

    override method recursoAnimacion() = personaje.animacionImpacto()

    override method terminoAnimacion() {
        personaje.cambiarEfecto(sinEfecto)
    }

}