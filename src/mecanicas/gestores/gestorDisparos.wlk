class GestorDisparosBase {
  const disparosActivos = []
  method disparosActivos () = disparosActivos
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
}

// 1. El del jugador: Solo registra/libera, no le importan los límites numéricos
object gestorJugador inherits GestorDisparosBase {
  // El límite del jugador se maneja por Cooldown (tiempo), aquí siempre puede
  override method puedeDisparar() = true
}

// 2. El de los enemigos: Controla la cantidad en pantalla y se ve afectado por la dificultad
object gestorEnemigos inherits GestorDisparosBase {
  var property limiteMaximo = 5 // Base inicial

  override method puedeDisparar() {
    return self.cantidadActivos() < limiteMaximo
  }

  // Cumple con el requerimiento de cómo le afecta la dificultad
  method ajustarPorDificultad(factor) {
    limiteMaximo = (limiteMaximo * factor).truncate(0)
  }
}
