import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.menu.menus.menuControles.*
import src.sonidos.sonido.*
    object menuReglas {
      
        method iniciarMenu(){
            game.clear()      
            musicaMenu.iniciar()
            game.boardGround("reglas2.png")
            keyboard.space().onPressDo({ menuControles.iniciarMenu() sonido.reproducir("choose.mp3")})
      
      }
    }