import src.sonidos.musicaMenu.*
import src.menu.menu.*


object victoria {
  
    method iniciarMenu() {
      musicaMenu.detener()
      musicaVictoria.iniciar()
      menu.menuInicial("ganaste.png")
    }
}