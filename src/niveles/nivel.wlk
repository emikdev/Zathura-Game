import src.mecanicas.gestores.gestorNiveles.*
import src.mecanicas.gestores.gestorDeMuros.*
import src.menu.configuracion.*

class Nivel {

    const oleadas // lista de oleadas pre diseñadas

    // Arranca el nivel: los muros se crean una sola vez y después empiezan las oleadas
    method iniciar() {
        gestorMuros.iniciar(configuracion.dificultad())
        self.cargar()
    }

    method cargar() { // Arranca la oleada actual
        self.oleadaActual().iniciar(self)
    }

    method oleadaActual() { // La oleada actual siempre es la primera de la lista
        return oleadas.first()
    }

    method removerOleadaActual() {
        oleadas.remove(self.oleadaActual())
    }

    method hayOleadasPendientes() {
        return not oleadas.isEmpty()
    }

    // Lo llama la formación cuando se queda sin enemigos
    method formacionVacia() {
        self.removerOleadaActual()
        if (self.hayOleadasPendientes()) {
            self.cargar()
        } else {
            self.nivelTerminado()
        }
    }

    method nivelTerminado() {
        gestorMuros.detener()
        gestorNiveles.terminarNivel()
    }

}