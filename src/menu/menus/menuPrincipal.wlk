import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.menu.seleccionador.*
import src.menu.menus.menuReglas.*

object menuPrincipal {

    method iniciarMenu() {

      game.boardGround("fondo.png")
      musicaMenu.iniciar()

      menu.mostrar(
        "menuPrincipal.png",
        [
          new Opcion(image = "jugar.png", valor = "jugar", position = game.center().left(10).down(4)),
          new Opcion(image = "salir.png", valor = "salir", position = game.center().right(-1).down(4))
        ],
        { opcion =>
          if (opcion.valor() ==  "jugar") menuReglas.iniciarMenu() else game.stop()
        }
      )
    }
}