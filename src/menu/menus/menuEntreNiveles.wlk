import src.sonidos.sonido.*
import src.gestores.gestorNiveles.*
import src.gestores.gestorOvnis.*
import src.gestores.gestorNaves.*
import src.gestores.gestorBufos.*
import src.gestores.reloj.*
import wollok.game.*

object entreNiveles {
   method iniciarMenu() {
      gestorBufos.detener() // 1°: Apaga el spawn y borra los bufos + sus onTick
      reloj.limpiarTodo()   // 2°: Limpia el reloj
      game.clear()          // 3°: Limpia el tablero
      
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
        gestorBufos.iniciar()          // Habilita los bufos ANTES de cargar los enemigos
        gestorNiveles.iniciarNivelActual() 
        sonido.reproducir("choose.mp3")
      })
    }
}
