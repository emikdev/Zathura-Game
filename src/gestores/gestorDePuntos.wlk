import wollok.game.*
import src.menu.seleccionador.*


object gestorPuntaje {

    var puntos = 0
  
    method puntos() = puntos // getter de puntos

    method sumar(cantidad) { puntos += cantidad } // la acumulacion de puntos.

    method reiniciar() { puntos = 0 } 

    method mostrar() {
        const score = new Cartel (image = "scorePrueba.png", position = game.at(13,game.height() -1) )
        game.addVisual(score)
        game.addVisual(mil)
        game.addVisual(centena)
        game.addVisual(decena)
        game.addVisual(unidad)
    }
}

class Numero {
    method position()
    method numero()
    method image() = "numero_" + self.numero().toString() + ".png"
}

object mil inherits Numero {
    override method position() = game.at(16, game.height() - 1)
    override method numero() = gestorPuntaje.puntos().div(1000).rem(10)
}

object centena inherits Numero {
    override method position() = mil.position().right(1)
    override method numero() = gestorPuntaje.puntos().div(100).rem(10)
}

object decena inherits Numero {
    override method position() = centena.position().right(1)
    override method numero() = gestorPuntaje.puntos().div(10).rem(10)
}

object unidad inherits Numero {
    override method position() = decena.position().right(1)
    override method numero() = gestorPuntaje.puntos().rem(10)
}