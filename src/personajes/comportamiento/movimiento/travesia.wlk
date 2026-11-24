import wollok.game.*
import src.personajes.comportamiento.movimiento.movimientosEnemigo.*

class Travesia inherits ComportamientoMovimiento {
  const intervalo
  const direccion
  var acumulado = 0
  var activa = true

  override method tick(enemigo, deltaMs) {
    if (activa) {
      acumulado += deltaMs
      if (acumulado >= intervalo) {
        acumulado = 0
        self.paso(enemigo)
      }
    }
  }

  method paso(enemigo) {
    if (direccion.puedeAvanzar(enemigo.position())) {
      enemigo.mover(direccion)
    } else {
      self.cruzoElTablero(enemigo)
    }
  }

  method cruzoElTablero(enemigo) {
    self.detener()
    enemigo.detener()
  }
  method detener() {
    activa = false
  }
}