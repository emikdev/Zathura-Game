class Animador {
  const property frames
  var frameActual = 0

  method imagenActual() = frames.get(frameActual)

  method avanzarFrame() {
    const esElUltimo = (frameActual == frames.size() - 1)
    if (not esElUltimo) {
      frameActual += 1
    }
    return esElUltimo
  }

  // Permite que el disparo reinicie el ciclo al cambiar de celda
  method reiniciar() {
    frameActual = 0
  }
}
