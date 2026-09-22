import wollok.game.*

import src.mecanicas.direcciones.*


// Representa un proyectil que se encuentra actualmente dentro del juego
class Disparo {

  // Datos recibidos de la Bala
  var frames
  var dano
  var velocidad

  // Estado propio del disparo definido por el personaje que lo origino
  var property position
  var property direccion
  var property bando

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

    if (frames.isEmpty()) {

      // Seguro para que no se generen disparos invalidos
      self.destruir()

    } else {

      game.addVisual(self)

      // La velocidad representa el tiempo total de una celda.
      // Lo dividimos entre la cantidad de frames para obtener
      // cuánto tiempo permanece cada frame en pantalla.
      game.onTick(self.velocidad() / frames.size(), self, { self.actualizar() })

    }

    // El disparo se encarga de gestionar sus propias colisiones
    game.onCollideDo(self, { objetivo => self.colisionarCon(objetivo) })

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