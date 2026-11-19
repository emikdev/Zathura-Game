import wollok.game.*

object reloj {
  const tickEnMs = 100
  var acumulado = 0
  var pausado = false

  // Una única lista polimórfica: todo lo que sepa responder a tick(deltaMs)
  const tickeables = []

  method iniciar() {
    game.onTick(tickEnMs, "relojGlobal", { self.tick() })
  }

  method tick() {
    if (not pausado) {
      acumulado += tickEnMs
      // El Reloj no sabe qué son estos objetos, solo sabe que entienden tick()
      tickeables.copy().forEach({ t => t.tick(tickEnMs) })
    }
  }

  method pausar() { pausado = true }
  method reanudar() { pausado = false }

  // Único punto de entrada
  method registrar(tickeable) {
    if (not tickeables.contains(tickeable)) {
      tickeables.add(tickeable)
    }
  }

  // Único punto de salida (evita olvidos)
  method olvidar(tickeable) {
    tickeables.remove(tickeable)
  }

  method limpiarTodo() {
    tickeables.clear()
  }
}