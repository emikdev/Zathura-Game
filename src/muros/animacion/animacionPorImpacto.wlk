import src.mecanicas.animaciones.animacion.*

// Animación que no avanza sola por tiempo: avanza un frame cada vez que se lo piden.
// Al pedirle avanzar estando en el último frame, avisa a su estado con terminoAnimacion().
class AnimacionPorImpacto inherits Animacion {

  // Sin temporizador: el constructor de Animacion llama a animar() y acá no hace nada
  override method animar() { }

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