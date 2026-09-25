import wollok.game.*

import src.mecanicas.direcciones.*


// Representa un proyectil que se encuentra actualmente dentro del juego
class Disparo {

  // Datos recibidos de la Bala
  const frames
  const dano
  const velocidad

  // Estado propio del disparo definido por el personaje que lo origino
  var property position
  const direccion
  const property bando

  var frameActual = 0 // Frame actual de la animacion del disparo

  // Devuelve el daño que posee el disparo
  method dano() {

    return dano

  }

  // Devuelve la velocidad del disparo
  // Representa el tiempo total que tarda en recorrer una celda
  method velocidad() {

    return velocidad

  }

  // Devuelve la imagen correspondiente al frame actual
  method image() {

    return frames.get(frameActual)

  }

  // Actualiza el estado del disparo en cada tick
  method actualizar() {

    // Si llegamos al último frame,
    // termina la animación de esta celda y avanzamos
    if (frameActual == frames.size() - 1) {

      frameActual = 0
      self.avanzar()

    } else {

      frameActual = frameActual + 1

    }

  }

  // Comienza el ciclo de vida del disparo
  method iniciar() {
    if (frames.isEmpty() or velocidad <= 0) {
      self.destruir()  // el mensaje destiur ya comprueba solo si el elemento fue destruido que si en lugar del return utilizamos destruir para eliminar los restos
      // self.error("Fallo al iniciar el disparo) // esto es para nosotros saber si es un fallo de generación pero tranquila mente se puede eliminar
    }

    game.addVisual(self)

    // La velocidad indica cuántas celdas completa el disparo por segundo.
    const duracionCelda = 1000 / velocidad
    // Convertimos a entero 
    const duracionFrame = duracionCelda / frames.size() // esta parte hay contradicciones en que acepta decimales y otras que no lo probé y acepta que si no tendría que haber problemas

    game.onTick(duracionFrame, self, {
      self.actualizar()
    })

    game.onCollideDo(self, { objetivo =>
      self.colisionarCon(objetivo)
    })
  }

  // Intenta avanzar hacia la siguiente celda
  method avanzar() {

    try {

      position = direccion.siguiente(position)

    } catch e : DomainException {

      // Si no existe la siguiente celda,
      // significa que el disparo salió del tablero.
      self.destruir()

    }

  }

  // Gestiona una colision con otro objeto
  method colisionarCon(objetivo) {

    // Si el otro objeto tambien es un disparo,
    // ignoramos la colision y ambos continuan.
    if (objetivo.className() != self.className()) {

      // Si pertenecen a bandos diferentes,
      // el objetivo recibe el dano del disparo.
      if (objetivo.bando() != self.bando()) {

        objetivo.recibirDano(self.dano())

        // Un impacto valido consume el disparo.
        self.destruir()

      }

    }

  }

  // Elimina el disparo del juego
  method destruir() {

    try {

      game.removeTickEvent(self)

    } catch e : Exception {

      // Evita problemas si el evento ya fue eliminado

    }

    if (game.hasVisual(self)) {

      game.removeVisual(self)

    }

  }

}

/*

  Todo objeto que exista en el juego debe entender bando() y recibirDano(dano), donde cada objeto se encarga de implementar que significa recibir dano para el.
  Todo objeto que tenga que disparar debe tener definido el metodo disaprar(): 
  
  method disparar(bala) {

    const nuevoDisparo = new Disparo(

      frames = bala.frames(),
      dano = bala.dano(),
      velocidad = bala.velocidad(),
      position = self.position().direccion(1),
      direccion = abajo,
      bando = personaje.bando()
      
    )

    nuevoDisparo.iniciar()

  }

*/