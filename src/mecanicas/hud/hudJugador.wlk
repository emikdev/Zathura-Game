import wollok.game.*
import src.menu.configuracion.*
import src.mecanicas.hud.visualsHud.*

object hud {

    // Recibe las naves como parametro desde gestor de naves, ya que es quien conoce a las naves en el juego y sus stats actuales
    method iniciar(naves) { 

        // Posiciones base se crea dentro de iniciar ya que de otro modo toma los valores default de width o height
        const posicionesBase = [game.at(0, 0), game.at(game.width() - 4, 0)] 


        naves.size().times({ n => 
            const i = n - 1
            const nave = naves.get(i)
            const posicion = posicionesBase.get(i)

            const visualVida = new VisualVida(nave = nave, posicion = posicion)
            const visualArma = new VisualArma(nave = nave, posicion = posicion.right(1))
            const decenaMunicion = new Decena(nave = nave, posicion = posicion.right(2))
            const unidadMunicion = new Unidad(nave = nave, posicion = posicion.right(3))

            game.addVisual(visualVida)
            game.addVisual(visualArma)
            game.addVisual(decenaMunicion)
            game.addVisual(unidadMunicion)
        })
    }
}
