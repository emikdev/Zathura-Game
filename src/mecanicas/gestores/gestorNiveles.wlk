import src.menu.musicaMenu.*
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
            // TODO: Cartel de pasar a siguiente nivel
            game.schedule(5000, { self.nivelActual().cargar() })
        } else {
            self.ganar()
        }
    }

    method ganar() {
        musicaInGame.detener()
        musicaVictoria.iniciar()
        generadorOvnis.detener()
        menu.menuVictoria()
    }

    method gameOver() {
        musicaInGame.detener()
        generadorOvnis.detener()
        menu.menuGameOver()
    }
}