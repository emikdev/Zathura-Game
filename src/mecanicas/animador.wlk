class Animador {
  const property frames

  // Devuelve el string del archivo de imagen actual
  method imagenActual() = frames.first()

  // Avanza el frame. Si llega al final, avisa que terminó la celda (devuelve true)
  method avanzarFrame() {
    const imagenActaul = self.imagenActual()
    frames.remove(self.imagenActual())
    frames.add(self.imagenActual())
  }
}

/* 
    // se crear un animador en un classe
    // Creamos un animador exclusivo para esta nueva bala
    const animacionBala = new Animador(frames = framesBala)
    method actualizar() {
    // Avanza el frame. Si el animador avisa que terminó el ciclo (true), avanza de celda
    const terminoCiclo = animacion.avanzarFrame()
    // El cálculo del tiempo usa los frames que tiene guardados el animador
    const duracionFrame = (1000 / velocidad)(este calculo es el de deplazamiento de la bala) / animacion.frames().size()  
*/