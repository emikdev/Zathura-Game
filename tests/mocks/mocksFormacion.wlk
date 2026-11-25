import wollok.game.*

class EnemigoMock {
  var property position
  const nombre = "enemigo"
  var ataques = 0
  const eventos = []

  method mover(direccion) {
    position = direccion.siguiente(position)
    eventos.add("mover " + nombre)
  }

  method intentarAtacar() {
    ataques += 1
    eventos.add("atacar " + nombre)
  }
  
  // Requerido por el nuevo Formacion.paso()
  method prepararPaso() { }

  method ataques() = ataques
  method eventos() = eventos
}

class NivelMock {
  var avisos = 0

  // Requerido por la nueva firma: formacionVacia(formacion)
  method formacionVacia(formacion) { avisos += 1 }

  method avisos() = avisos
}