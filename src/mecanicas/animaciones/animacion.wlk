import src.gestores.reloj.*

class Animacion {
  const estado
  const recursoDeAnimacion
  const autoAvance
  var frameActual = 0
  var acumulado = 0
  var activa = true // el flag activa evita que un tick tardío después de detener() intente avanzar un frame.

  method frameActual() = recursoDeAnimacion.frames().get(frameActual)
  method activa() = activa

  method initialize() {
      if (autoAvance) { reloj.registrar(self) }
    }
  
  method tick(deltaMs) {
    if (activa) {
      if (recursoDeAnimacion.frames().size() == 1) {
        acumulado += deltaMs
        if (acumulado >= recursoDeAnimacion.duracion()) {
          estado.terminoAnimacion()
        }
      } else {
        acumulado += deltaMs
        const msPorFrame = recursoDeAnimacion.duracion() / recursoDeAnimacion.frames().size()
        if (acumulado >= msPorFrame) {
          acumulado = 0
          if (frameActual < recursoDeAnimacion.frames().size() - 1) {
            frameActual += 1
          } else {
            estado.terminoAnimacion()
          }
        }
      }
    }
  }
  
  method avanzarFrameBase() {
    if (recursoDeAnimacion.frames().size() > 1) {
      frameActual = (frameActual + 1) % recursoDeAnimacion.frames().size()
    }
  }

  method reiniciar() {
    frameActual = 0
    acumulado = 0
  }

  method detener() {
    activa = false
    reloj.olvidar(self)
  }

  method retirar() {
    self.detener()
  }

  method posicionarEnFrame(indice) {
    frameActual = indice
  }

}