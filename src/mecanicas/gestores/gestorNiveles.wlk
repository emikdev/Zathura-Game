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
            // TODO: hacer que el method iniciar corra el nivel que sigue, si se puede, si no habra que refactorizar para que corra, pero yo creo que se puede correr el nivel
            // que sigue simplemente con una lista, cada vez que se corre uno lo borra y el iniciar() corra el primer nivel que hay.
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