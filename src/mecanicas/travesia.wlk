import wollok.game.*
import src.mecanicas.direcciones.*

// Mueve a un personaje en línea recta hasta el otro borde.
class Travesia {

  const nivel
  const intervalo
  const direccion
  var personaje = []

  method agregar(unPersonaje) {
    personaje = unPersonaje
  }

  method iniciar() {
    game.onTick(intervalo, self.nombreTick(), { self.paso() })
  }

  method detener() {
    game.removeTickEvent(self.nombreTick())
  }

  method nombreTick() {
    return "travesia" + self.identity()
  }

  method paso() {
    if (direccion.puedeAvanzar(personaje.position())) {
      personaje.mover(direccion)
    } else {
      self.cruzoElTablero()
    }
  }

  // Llegó al otro lado sin que lo maten
  method cruzoElTablero() {
    self.detener()
    personaje.retirar()
    nivel.travesiaTerminada(self)
  }

  // Lo llama el enemigo al quedarse sin vidas (mismo mensaje que a una formación)
  method quitar(unPersonaje) {
    self.detener()
    nivel.travesiaTerminada(self)
  }

}