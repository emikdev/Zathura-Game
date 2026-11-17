import src.menu.configuracion.*

class GestorDisparosBase {
  const disparosActivos = []

  method disparosActivos() = disparosActivos
  method puedeDisparar()

  method registrarDisparo(disparo) {
    if (not disparosActivos.contains(disparo)) {
      disparosActivos.add(disparo)
    }
  }

  method liberarDisparo(disparo) {
    disparosActivos.remove(disparo)
  }

  method cantidadActivos() = disparosActivos.size()

  // Destruye todas las balas en vuelo y vacía la lista
  method limpiar() {
    disparosActivos.copy().forEach({ disparo => disparo.destruir() })
    disparosActivos.clear()
  }
}

object gestorJugador inherits GestorDisparosBase {
  override method puedeDisparar() = true
}

object gestorEnemigos inherits GestorDisparosBase {
  const limiteMaximo = 5

  override method puedeDisparar() = self.cantidadActivos() < self.limiteMaximo()

  method limiteMaximo() = limiteMaximo * configuracion.dificultad()
}
