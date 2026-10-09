class Animador {
  const property frames
  var frameActual = 0

  // Devuelve el string del archivo de imagen actual
  method imagenActual() = frames.get(frameActual)

  // Avanza el frame. Si llega al final, avisa que terminó la celda (devuelve true)
  method avanzarFrame() {
    if (frameActual == frames.size() - 1) {
      frameActual = 0
      return true // Avisa que completó un ciclo completo de animación
    } else {
      frameActual += 1
      return false
    }
  }
}
