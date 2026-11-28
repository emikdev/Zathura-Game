class OvniMock {
  var property position
  var movimientos = 0
  var detenidos = 0 

  method mover(direccion) {
    position = direccion.siguiente(position)
    movimientos += 1
  }

  method detener() {
    detenidos += 1
  }

  method movimientos() = movimientos
  method detenidos() = detenidos
}