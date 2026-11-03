import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*

object gestorNiveles {

    const niveles = [nivelUno]

    method iniciar() { // Arranca el generador de ovnis y carga el primer nivel
        generadorOvnis.iniciar()
        self.nivelActual().cargar()
    }

    method agregarNivel(nuevoNivel) {
        niveles.add(nuevoNivel)
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
        generadorOvnis.detener()
        // TODO: pantalla de victoria
    }

    method gameOver() {
        generadorOvnis.detener()
        // TODO: pantalla de derrota
    }
}