import wollok.game.*

// Libreta compartida donde los enemigos anotan lo que les piden, para comprobar el ORDEN de las acciones.
class RegistroDeEventos {
  const eventos = []

  method anotar(evento) { eventos.add(evento) }
  method eventos() = eventos
}

// Enemigo mínimo: lo único que usa la formación es su posición, mover(direccion) e intentarAtacar().
// mover() desplaza de verdad la posición, igual que lo haría un Personaje real.
class EnemigoMock {
  var property position
  const nombre = "enemigo"
  const registro = new RegistroDeEventos()
  var ataques = 0

  method mover(direccion) {
    position = direccion.siguiente(position)
    registro.anotar("mover " + nombre)
  }

  method intentarAtacar() {
    ataques += 1
    registro.anotar("atacar " + nombre)
  }

  method ataques() = ataques
}

// Nivel falso: solo cuenta cuántas veces la formación le avisó que se quedó sin enemigos.
class NivelMock {
  var avisos = 0

  method formacionVacia() { avisos += 1 }

  method avisos() = avisos
}