import wollok.game.*
import src.gestores.gestorOvnis.*
import src.personajes.comportamiento.movimiento.movimientosEnemigo.*

class Travesia inherits ComportamientoMovimiento {
  const intervalo
  const direccion
  var enemigo = null
  var acumulado = 0

  method agregar(unEnemigo) {
    enemigo = unEnemigo
  }

  method position() = enemigo.position()

  override method tick(enemigoActual, deltaMs) {
    acumulado += deltaMs
    if (acumulado >= intervalo) {
      acumulado = 0
      self.paso()
    }
  }

  method paso() {
    if (direccion.puedeAvanzar(enemigo.position())) {
      enemigo.mover(direccion)
    } else {
      self.cruzoElTablero()
    }
  }

  method cruzoElTablero() {
    self.detener()
    enemigo.retirar()
  }

  method detener() {
    gestorOvnis.quitar(enemigo) 
  }
}