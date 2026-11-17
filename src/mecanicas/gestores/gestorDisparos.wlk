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

  method limpiar() {
    disparosActivos.copy().forEach({ disparo => disparo.destruir() })
    disparosActivos.clear()
  }
}

object gestorJugador inherits GestorDisparosBase {
  override method puedeDisparar() = true
}

object gestorEnemigos inherits GestorDisparosBase {

  override method puedeDisparar() = self.cantidadActivos() < self.limiteMaximo()

  // Easy: 5 balas | Normal: 7 balas | Hard: 9 balas
  method limiteMaximo() = 3 + (configuracion.dificultad() * 2)

}
