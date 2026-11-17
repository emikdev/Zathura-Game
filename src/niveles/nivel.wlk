import src.mecanicas.gestores.gestorNiveles.*
import src.mecanicas.gestores.gestorDeMuros.*
import src.menu.configuracion.*

class Nivel {

  const oleadas // lista original de oleadas
  var oleadasPendientes = [] // copia mutable para la partida actual

  method iniciar() {
    oleadasPendientes = oleadas.copy()
    gestorMuros.iniciar(configuracion.dificultad())
    self.cargar()
  }

  method cargar() {
    self.oleadaActual().iniciar(self)
  }

  method oleadaActual() {
    return oleadasPendientes.first()
  }

  method removerOleadaActual() {
    oleadasPendientes.remove(self.oleadaActual())
  }

  method hayOleadasPendientes() {
    return not oleadasPendientes.isEmpty()
  }

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
