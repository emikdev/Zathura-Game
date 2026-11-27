import src.mecanicas.animaciones.animacion.*

class AnimacionPorImpacto inherits Animacion {

  // Ya no hace falta sobreescribir animar(), la clase padre no lo usa.
  // El autoAvance se pasa en false desde EnPie.

  method esUltimoFrame() = frameActual == recursoDeAnimacion.frames().size() - 1

  method avanzar() {
    if (activa) {
      if (self.esUltimoFrame()) {
        estado.terminoAnimacion()
      } else {
        frameActual += 1
      }
    }
  }
}