import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*
import src.menu.seleccionador.*
import src.menu.menus.menuSistemaPuntajes.*

object menuControles {
    method iniciarMenu(){
        game.clear()      
        musicaMenu.iniciar()
        game.boardGround("controles.png")
        keyboard.space().onPressDo({ menuSistemaPuntajes.iniciarMenu() sonido.reproducir("choose.mp3")})
    }
}