import src.sonidos.musicaMenu.*
import src.menu.menu.*
import src.gestores.reloj.*

object victoria {
    method iniciarMenu() {
      reloj.limpiarTodo() // Limpiamos el reloj por completo
      
      musicaMenu.detener()
      musicaVictoria.iniciar()
      menu.menuInicial("ganaste.png") // menuInicial ya hace game.clear()
    }
}