import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.menu.menus.menuUnJugador.*
import src.menu.menus.menuDosJugadores.*
object cantidadJugadores  {
  

  method iniciarMenu() {
      game.boardGround("fondo.png")

      menu.mostrar(
        "cuantosJugadores.png",
        [
          new Opcion(image = "unJugador.png", valor = 1, position = game.center().left(10).down(4)),
          new Opcion(image = "dosJugadores.png" , valor = 2, position = game.center().right(-1).down(4))
        ],
        { opcion =>
          configuracion.cantidadJugadores(opcion.valor()) 
          configuracion.tiposNaves().clear()
          if(opcion.valor() == 1 ) menuUnJugador.iniciarMenu() else menuDosJugadores.iniciarMenu()
        }
      )
    }

}