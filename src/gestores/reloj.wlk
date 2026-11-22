import wollok.game.*

object reloj {
  const tickEnMs = 100
  var acumulado = 0
  var pausado = false

  const tickeables = []

  method iniciar() {
    game.removeTickEvent("relojGlobal") 
    game.onTick(tickEnMs, "relojGlobal", { self.tick() })
  }

  method tick() {
    if (not pausado) {
      acumulado += tickEnMs
      tickeables.copy().forEach({ t => t.tick(tickEnMs) })
    }
  }

  method pausar() { pausado = true }
  method reanudar() { pausado = false }

  method registrar(tickeable) {
    if (not tickeables.contains(tickeable)) {
      tickeables.add(tickeable)
    }
  }

  method olvidar(tickeable) {
    tickeables.remove(tickeable)
  }

  // Limpia absolutamente todo de forma polimórfica
  method limpiarTodo() {
    tickeables.copy().forEach({ t => t.detener() })
    tickeables.clear()
  }
}