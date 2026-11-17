import src.mecanicas.animaciones.animacion.*

// Animación que no avanza sola por tiempo: avanza un frame cada vez que se lo piden.
// Al pedirle avanzar estando en el último frame, avisa a su estado con terminoAnimacion().
class AnimacionPorImpacto inherits Animacion {

  // Evita que se registre en gestorDeAnimaciones al instanciarse
  override method initialize() { }

  // Ignora el paso del tiempo del ciclo global por seguridad
  override method avanzarTiempo(ms) { }

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

  override method reiniciar() {
    frameActual = 0
    tiempoAcumulado = 0
    activa = true
  }

  override method detener() {
    activa = false
  }

}
