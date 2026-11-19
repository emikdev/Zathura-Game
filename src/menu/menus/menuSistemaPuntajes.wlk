import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*
import src.menu.seleccionador.*
import src.menu.menus.menuCantidadJugadores.*


object menuSistemaPuntajes  {
  
    method iniciarMenu() {
      game.clear()
      musicaMenu.iniciar()
      game.boardGround("sistemaPuntajes.png")
      keyboard.space().onPressDo({cantidadJugadores.iniciarMenu() sonido.reproducir("choose.mp3")})
    }

}