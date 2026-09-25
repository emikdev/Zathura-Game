import wollok.game.*

import src.mecanicas.direcciones.*
import src.mecanicas.disparo.*


// Representa un enemigo del juego
class Enemigo {
  
  // Estado del enemigo
  var property position
  var property hp

  const miBando = "enemigos"

  // Bala que utiliza este enemigo
  var property bala

  // Frames de la animacion normal
  const framesBase

  // Frames de la animacion de muerte
  const framesMuerte

  // Frame actual de la animacion
  var frameActual = 0

  // "normal"   -> participa de la formacion
  // "muriendo" -> reproduce animacion de muerte
  // "muerto"   -> ya no existe en el juego
  var estado = "normal"

  // Getter del bando del personaje
  method bando() {

    return miBando

  }

  // Getter de los hp del personje
  method hp() {

    return hp

  }

  // Getter que indica si el enemigo esta activo en la formacion
  method estaEnFormacion() {

    return estado == "normal"

  }

  // Getter que indica si el enemigo esta muerto
  method estaMuerto() {

    return estado == "muerto"

  }

  // Getetr que entrega la imagen correspondiente

  method image() {

    if (estado == "muriendo") {

      return framesMuerte.get(frameActual)

    }

    return framesBase.get(frameActual)

  }

  // Animaicon base del personaje

  // Reproduce toda la animacion base durante la duracion
  // indicada por la formacion.
  method animarBase(duracionTotal) {

    if (estado == "normal" and not framesBase.isEmpty()) {

      frameActual = 0

      const duracionFrame = duracionTotal / framesBase.size()

      self.animarSiguienteFrame(duracionFrame)

    }

  }

  // Avanza los frames de la animacion base
  method animarSiguienteFrame(duracionFrame) {

    if (estado == "normal") {

      if (frameActual < framesBase.size() - 1) {

        game.schedule(duracionFrame, {

          if (estado == "normal") {

            frameActual += 1

            self.animarSiguienteFrame(duracionFrame)

          }

        })

      }

    }

  }

  // Movimiento del personaje

  // La formacion decide cuando mover al enemigo y hacia donde.
  method mover(direccion) {

    if (estado == "normal") {

      position = direccion.siguiente(position)

    }

  }

  // Crea un disparo usando la Bala indicada.
  method disparar(bala) {

    if (estado == "normal") {

      const nuevoDisparo = new Disparo(

        frames = bala.frames(),
        dano = bala.dano(),
        velocidad = bala.velocidad(),
        position = self.position().down(1),
        direccion = abajo,
        bando = miBando

      )

      nuevoDisparo.iniciar()

    }

  }

  // Recibir dano
  method recibirDano(dano) {

    if (estado == "normal") {

      hp -= dano

      if (hp <= 0) {

        self.morir()

      }

    }

  }


  // Implementacion de muerte

  method morir() {

    estado = "muriendo"
    frameActual = 0

    self.animarMuerte()

  }

  // Animacion de muerte

  method animarMuerte() {

    if (framesMuerte.isEmpty()) {

      self.finalizarMuerte()

    } else {

      game.schedule(150, {

        if (estado == "muriendo") {

          if (frameActual < framesMuerte.size() - 1) {

            frameActual += 1

            self.animarMuerte()

          } else {

            self.finalizarMuerte()

          }

        }

      })

    }

  }

  // Morir

  method finalizarMuerte() {

    estado = "muerto"

    game.removeVisual(self)

  }

  // Iniciar el ciclo de vida del personaje
  method iniciar() {

    game.addVisual(self)

  }

}