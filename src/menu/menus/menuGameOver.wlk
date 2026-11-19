import src.sonidos.musicaMenu.*
import src.menu.menu.*
import src.sonidos.sonido.*

object gameOver{

    method iniciarMenu (){
      musicaMenu.detener()
      menu.menuInicial("perdiste.png")
      sonido.reproducir("fail.mp3")
    }
}