import wollok.game.*

import src.mecanicas.direcciones.*
import src.mecanicas.gestorDisparosEnemigos.*


// Representa un proyectil que se encuentra actualmente dentro del juego
class Disparo {

  // Datos recibidos de la Bala
  const frames
  const dano
  const velocidad

  // Estado propio del disparo definido por el personaje que lo origino
  var property position
  const direccion
  const bando

  // Frame actual de la animacion del disparo
  var frameActual = 0

  // Devuelve el bando al que pertenece el disparo
  method bando() {

    return bando

  }

  // Devuelve el dano que posee el disparo
  method dano() {

    return dano

  }

  // Devuelve la velocidad del disparo
  // Una velocidad mayor significa que el disparo viaja mas rapido.
  method velocidad() {

    return velocidad

  }

  // Devuelve la imagen correspondiente al frame actual
  method image() {

    return frames.get(frameActual)

  }

  // Actualiza el estado del disparo en cada tick
  method actualizar() {

    // Si llegamos al ultimo frame,
    // termina la animacion de esta celda y avanzamos.
    if (frameActual == frames.size() - 1) {

      frameActual = 0

      self.avanzar()

    } else {

      frameActual += 1

    }

  }

  // Comienza el ciclo de vida del disparo
  method iniciar() {

    if (frames.isEmpty() or velocidad <= 0) {

      // No se inicia un disparo invalido.
      self.destruir()

    } else {

      game.addVisual(self)

      // La velocidad indica cuantas celdas completa
      // el disparo por segundo.
      const duracionCelda = 1000 / velocidad

      // La duracion total de la celda se reparte
      // entre todos sus frames.
      const duracionFrame = duracionCelda / frames.size()

      // Actualizacion de movimiento y animacion.
      game.onTick(duracionFrame, self, { self.actualizar() })

      // El disparo gestiona sus propias colisiones.
      game.onCollideDo(self, { objetivo => self.colisionarCon(objetivo) })

      // Solo los disparos enemigos ocupan un lugar dentro del limite global de proyectiles enemigos.
      if (bando == "enemigos") {

        gestorDisparosEnemigos.registrarDisparo(self)

      }

    }

  }

  // Intenta avanzar hacia la siguiente celda
  method avanzar() {

    try {

      position = direccion.siguiente(position)

    } catch e : DomainException {

      // Si no existe la siguiente celda,
      // significa que el disparo salio del tablero.
      self.destruir()

    }

  }

  // Gestiona una colision con otro objeto
  method colisionarCon(objetivo) {

    // Otro disparo no es un objetivo valido.
    if (objetivo.className() != self.className()) {

      // Si pertenece al mismo bando, no recibe dano y el disparo continua.
      if (objetivo.bando() != self.bando()) {

        // El objetivo gestiona el dano recibido.
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

      // Evita problemas si el evento ya fue eliminado.

    }

    // Si era un disparo enemigo, deja de ocupar un lugar en el registro.
    if (bando == "enemigos") {

      gestorDisparosEnemigos.liberarDisparo(self)

    }

    if (game.hasVisual(self)) {

      game.removeVisual(self)

    }

  }

}