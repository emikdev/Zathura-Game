import wollok.game.*

object gestorDeAnimaciones {
  const animacionesActivas = #{}
  const tickMs = 20

  method iniciar() {
    animacionesActivas.clear()
    game.onTick(tickMs, "cicloGlobalAnimaciones", {
      self.actualizar()
    })
  }

  method limpiar() {
    animacionesActivas.clear()
  }

  method detener() {
    game.removeTickEvent("cicloGlobalAnimaciones")
    animacionesActivas.clear()
  }

  method registrar(animacion) {
    animacionesActivas.add(animacion)
  }

  method desregistrar(animacion) {
    animacionesActivas.remove(animacion)
  }

  method actualizar() {
    animacionesActivas.copy().forEach({ animacion =>
      if (animacion.activa()) {
        animacion.avanzarTiempo(tickMs)
      } else {
        animacionesActivas.remove(animacion)
      }
    })
  }
}
