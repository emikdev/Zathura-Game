import src.sonidos.sonido.*
import src.gestores.gestorNiveles.*
import src.gestores.gestorOvnis.*
import src.gestores.gestorNaves.*
import src.gestores.reloj.*
import wollok.game.*

object entreNiveles {
   method iniciarMenu() {
      game.clear() 
      reloj.limpiarTodo() 
      
      sonido.reproducir("levelPassed.mp3")
      game.boardGround("entreNiveles.png")
      
      keyboard.space().onPressDo({
        game.clear() 
        reloj.limpiarTodo() 
        
        reloj.iniciar() 
        reloj.registrar(gestorOvnis) 
        
        // RESTAURAMOS NAVES, CONTROLES Y HUD
        gestorNaves.restaurarVisuales() 
        
        game.boardGround("fondo.png")
        gestorNiveles.iniciarNivelActual() 
        
        sonido.reproducir("choose.mp3")
      })
    }
}