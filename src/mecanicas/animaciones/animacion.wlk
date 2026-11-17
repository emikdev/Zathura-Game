import src.mecanicas.gestores.gestorAnimaciones.*

class Animacion {
  const estado
  const recursoDeAnimacion
  var frameActual = 0
  var tiempoAcumulado = 0
  var activa = true

  method activa() = activa

  method initialize() {
    gestorDeAnimaciones.registrar(self)
  }

  method frameActual() = recursoDeAnimacion.frames().get(frameActual)

  method avanzarTiempo(ms) {
    if (activa) {
      tiempoAcumulado += ms
      self.procesarFrames()
    }
  }

  method procesarFrames() {
    const tiempoPorFrame = recursoDeAnimacion.tiempoPorFrame()
    if (activa && tiempoAcumulado >= tiempoPorFrame) {
      tiempoAcumulado -= tiempoPorFrame
      self.siguienteFrame()
      self.procesarFrames()
    }
  }

  method siguienteFrame() {
    if (frameActual < (recursoDeAnimacion.frames().size() - 1)) {
      frameActual += 1
    } else {
      estado.terminoAnimacion()
    }
  }

  method reiniciar() {
    frameActual = 0
    tiempoAcumulado = 0
    activa = true
    gestorDeAnimaciones.registrar(self)
  }

  method detener() {
    activa = false
    gestorDeAnimaciones.desregistrar(self)
  }
}
