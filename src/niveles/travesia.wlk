import wollok.game.*

// Mueve a un enemigo en línea recta hasta el otro borde.
class Travesia {

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

  method nombreTick(){
    return "travesia" + self.identity()
  }

  method paso() {
    if (direccion.puedeAvanzar(personaje.position())) {
      personaje.mover(direccion)
    } else {
      self.cruzoElTablero()
    }
  }

  method cruzoElTablero() {
    self.detener()
    personaje.retirar()
  }

  // Lo llama el enemigo al quedarse sin vidas (mismo mensaje que a una formación)
  method quitar(unEnemigo) {
    self.detener()
  }

}