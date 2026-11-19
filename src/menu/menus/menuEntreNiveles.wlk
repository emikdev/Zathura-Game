import src.sonidos.sonido.*
import src.menu.menu.*

object entreNiveles {

   method iniciarMenu() {
      game.clear()
      sonido.reproducir("levelPassed.mp3")
      game.boardGround("entreNiveles.png")
      keyboard.space().onPressDo({menu.empezar() sonido.reproducir("choose.mp3")})
    }

}