import wollok.game.*

// Personaje mínimo para la travesía: lo único que usa es su posición, mover(direccion) y retirar().
// mover() desplaza de verdad la posición, igual que lo haría un Personaje real.
class OvniMock {
  var property position
  var movimientos = 0
  var retiradas = 0

  method mover(direccion) {
    position = direccion.siguiente(position)
    movimientos += 1
  }

  method retirar() {
    retiradas += 1
  }

  method movimientos() = movimientos
  method retiradas() = retiradas
}