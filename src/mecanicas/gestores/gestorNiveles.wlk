import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.mecanicas.gestores.gestorBufos.* // 1. Importar el gestor de bufos
import src.menu.menu.*

object gestorNiveles {

    const niveles = [nivelUno]

    method iniciar() { // Arranca el generador de ovnis y carga el primer nivel
        generadorOvnis.iniciar()
        gestorBufos.iniciar() // Arranca la caída de bufos
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
        gestorBufos.detener() // Limpia los bufos en pantalla antes de mostrar el menú entre niveles

        if (self.haySiguienteNivel()) {

            menu.menuEntreNiveles()
            // TODO: hacer que el method iniciar corra el nivel que sigue, si se puede, si no habra que refactorizar para que corra, pero yo creo que se puede correr el nivel
            // que sigue simplemente con una lista, cada vez que se corre uno lo borra y el iniciar() corra el primer nivel que hay.
            game.schedule(5000, { 
                self.nivelActual().cargar()
                gestorBufos.iniciar() // Vuelve a activarlos cuando arranca el siguiente nivel
            })
        } else {
            self.ganar()
        }
    }

    method ganar() {
        musicaInGame.detener()
        musicaVictoria.iniciar()
        generadorOvnis.detener()
        gestorBufos.detener() // Limpia todo al ganar
        menu.menuVictoria()
    }

    method gameOver() {
        musicaInGame.detener()
        generadorOvnis.detener()
        gestorBufos.detener() // Limpia todo al perder
        menu.menuGameOver()
    }
}
