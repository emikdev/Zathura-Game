import src.mecanicas.gestores.gestorNiveles.*

class Nivel {

    const oleadas // lista de oleadas pre diseñadas

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
        gestorNiveles.terminarNivel()
    }

}