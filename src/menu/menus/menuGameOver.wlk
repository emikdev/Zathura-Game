import src.sonidos.musicaMenu.*
import src.menu.menu.*
import src.sonidos.sonido.*
import src.gestores.reloj.*

object gameOver {
    method iniciarMenu (){
      reloj.limpiarTodo() // Limpiamos el reloj por completo
      
      musicaMenu.detener()
      menu.menuInicial("perdiste.png") // menuInicial ya hace game.clear()
      sonido.reproducir("fail.mp3")
    }
}