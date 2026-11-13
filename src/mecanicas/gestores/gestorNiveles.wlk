import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.menu.menu.*

object gestorNiveles {

    const niveles = [nivelUno]

    method iniciar() { // Arranca el generador de ovnis y carga el primer nivel
        generadorOvnis.iniciar()
        self.nivelActual().cargar()
        gestorNaves.iniciar()
    }

    method nivelActual() { // Primer nivel de la lista
        return niveles.first()
    }

    method removerNivelActual() {
        niveles.remove(self.nivelActual())
    }

    method haySiguienteNivel() { // Quedan niveles después de sacar el actual
        return not niveles.isEmpty()
    }

    method terminarNivel() { // Método llamado por nivel
        self.removerNivelActual()

        if (self.haySiguienteNivel()) {
            menu.menuEntreNiveles() 
            // TODO: Hablar de como va a funcionar esto, para mi (Joaquin) deberia accionarse el siguiente nivel apartir de que el jugador de al espacio una vez terminado el nivel
            // yo en los menus tengo un metodo que se llama empezar y ese llama a gestorNiveles.iniciar() en iniciar podrias modificarlo para que inicie el nivel que sigue de los que
            // hay en la lista
            game.schedule(5000, { self.nivelActual().cargar() })
        } else {
            self.ganar()
        }
    }

    method ganar() {
        generadorOvnis.detener()
        menu.menuVictoria()
    }

    method gameOver() {
        generadorOvnis.detener()
        menu.menuGameOver()
    }
}