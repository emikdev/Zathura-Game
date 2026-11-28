import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*
import src.menu.seleccionador.*
import src.menu.configuracion.*

object menuDificultad{

  method iniciarMenu() {
    menu.mostrar(
      "elegiLaDificultad.png",
      [
        new Opcion(image = "easy.png", valor = 1, position = game.center().left(10).down(4)),
        new Opcion(image = "normal.png", valor = 2, position = game.center().down(4).left(5)),
        new Opcion(image = "hard.png", valor = 3, position = game.center().right(0).down(4))
      ],
      { opcion =>
        configuracion.dificultadElegida(opcion.valor())
        menu.empezar()
      }
    )
  }

}