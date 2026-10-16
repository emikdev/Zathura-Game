class Animador {
  
  const frames // Frames disponibles de animacion 
  const velocidad // Determina velocidad de animacion
  var frameActual = 0 // Puntero de frame actual 
  var property seTerminoAnimacion = false // Flag de animacion activa

  method frameActual(){ // Devuelve el frame actual de animacion
    
    return frames.get(frameActual)

  }

  method animar(){

    self.seTerminoAnimacion(false) // Flag animacion en curso
    
    if(frameActual != frames.size() - 1){ // Determina que haya un siguiente frame aun
      
      game.schedule(velocidad, {

        frameActual+=1 // Avanza en uno el frame el puntero del frame actual
        self.animar() // Se llama de nuevo a si mismo para repetir el ciclo de ser posible 
      
      })
    }

    self.seTerminoAnimacion(true) // Flag determina que ya no hay animacion en curso
    frameActual = 0 // Devuelve el puntero a 0
  }
}