import wollok.game.*

import src.mecanicas.direcciones.*
import src.mecanicas.disparo.*
import src.mecanicas.gestorDisparosEnemigos.*

// Representa un enemigo del juego
class Enemigo {

  // Estado del personaje
  var property position
  var property hp

  const bando = "enemigos"

  // Comportamiento que decide que accion realizar
  const comportamientoAtaque

  // Frames de la animacion normal
  const framesBase

  // Frames de la animacion de muerte
  const framesMuerte

  // Frame actual de la animacion
  var frameActual = 0

  // Frame actual de la animacion de muerte
  var frameMuerteActual = 0


  // Estados
  // normal    -> participa de la formacion
  // muriendo  -> reproduce animacion de muerte
  // muerto    -> ya no participa del juego
  var estado = "normal"

  // Identificador unico del evento de ataque
  const idTickAtaque = "tick_ataque_enemigo_" + self.identity().toString()

  // Identificador de la animacion base actual.
  // Permite invalidar animaciones anteriores cuando comienza un nuevo ciclo.
  var cicloAnimacionBase = 0

  // Getter que entrega el bando del personaje
  method bando() {

    return bando

  }

  // Getter que indica si el personaje esta activo en la formacion
  method estaEnFormacion() {

    return estado == "normal"

  }

  // Getter que indica si el personaje esta muerto
  method estaMuerto() {

    return estado == "muerto"

  }

  // Getter que permite saber los hp del personje
  method hp() {

    return hp

  }

  // Metodo que entrega la imagen del persoinaje
  method image() {

    if (estado == "muriendo") {

      return framesMuerte.get(frameMuerteActual)

    }

    return framesBase.get(frameActual)

  }


  // Animacion base de los personjaes enemigos 

  // Reproduce la animacion completa del enemigo durante el tiempo indicado por la formacion, es decir, en el tiempo que hay entre movimientos de formacion
  // La cantidad de frames puede ser distinta para cada enemigo.
  method animarBase(duracionTotal) {

    if (estado == "normal" and not framesBase.isEmpty()) {

      // Invalidamos cualquier animacion base anterior
      cicloAnimacionBase += 1

      const cicloActual = cicloAnimacionBase

      frameActual = 0

      const duracionFrame = duracionTotal / framesBase.size()

      self.animarSiguienteFrame(duracionFrame, cicloActual)

    }

  }


  // Avanza los frames de la animacion base
  method animarSiguienteFrame(duracionFrame, cicloAnimacion) {

    if (estado == "normal" and cicloAnimacion == cicloAnimacionBase) {

      if (frameActual < framesBase.size() - 1) {

        game.schedule(duracionFrame, {

          if (estado == "normal" and cicloAnimacion == cicloAnimacionBase) {

            frameActual += 1

            self.animarSiguienteFrame(duracionFrame, cicloAnimacion)

          }

        })

      }

    }

  }


  // Movimiento de los personajes controlado por la formacion

  // La formacion decide cuando mover al enemigo.
  // La direccion verifica que la siguiente celda exista.
  method mover(direccion) {

    if (estado == "normal") {

      position = direccion.siguiente(position)

    }

  }

  // Mensaje que le permite al personaje gestionar impactos con los disparos
  method recibirDano(dano) {

    if (estado == "normal") {

      hp -= dano

      if (hp <= 0) {

        self.morir()

      }

    }

  }

  // Intentar disparar

  // El comportamiento de ataque llama a este metodo cuando quiere disparar.
  // Enemigo se encarga de verificar las condiciones necesarias para que el disparo realmente ocurra.
  method intentarDisparar(bala) {

    if (estado == "normal") {

      if (not self.hayEnemigoDelante()) {

        if (gestorDisparosEnemigos.puedeDisparar()) {

          self.disparar(bala)

        }

      }

    }

  }

  // Crea el proyectil. El metodo no decide cuando disparar: esa decision pertenece a comportamientoAtaque.
  method disparar(bala) {

    const nuevoDisparo = new Disparo(

      frames = bala.frames(),
      dano = bala.dano(),
      velocidad = bala.velocidad(),

      // Los enemigos disparan hacia abajo
      position = self.position().down(1),

      direccion = abajo,

      bando = bando

    )

    nuevoDisparo.iniciar()

  }

  // Determina si existe otro enemigo de la formacion exactamente en la celda que esta debajo.
  method hayEnemigoDelante() {

    try {

      const posicionDelante = abajo.siguiente(position)

      return game.allVisuals().any({ objeto =>

        try {

          objeto.estaEnFormacion()
          and objeto.position() == posicionDelante
          and objeto != self

        } catch e : Exception {

          false

        }

      })

    } catch e : DomainException {

      // Si no existe una celda debajo, no hay un enemigo delante.
      return false

    }

  }

  // Inicia el ciclo de oportunidades de ataque.
  method iniciarAtaque() {

    game.onTick(1000, idTickAtaque, {

      if (estado == "normal") {

        comportamientoAtaque.actuar(self)

      }

    })

  }

  // Disparador del proceso de muerte del personaje
  method morir() {

    // Detenemos inmediatamente las oportunidades de ataque del enemigo.
    game.removeTickEvent(idTickAtaque)

    estado = "muriendo"
    frameMuerteActual = 0

    // Invalidamos cualquier animacion base pendiente.
    cicloAnimacionBase += 1

    self.animarMuerte()

  }

  // Animacion de muerte del personaje
  method animarMuerte() {

    if (framesMuerte.isEmpty()) {

      self.finalizarMuerte()

    } else {

      game.schedule(150, {

        if (estado == "muriendo") {

          if (frameMuerteActual < framesMuerte.size() - 1) {

            frameMuerteActual += 1

            self.animarMuerte()

          } else {

            self.finalizarMuerte()

          }

        }

      })

    }

  }

  // Remove el visual del enemigo y lo inabilita de la formacion
  method finalizarMuerte() {

    // Primero eliminamos el visual para que no vuelva a pedir image()
    // usando el indice de la animacion de muerte.
    game.removeVisual(self)

    estado = "muerto"

  }

  // Iniciar el ciclo de vida del personaje
  method iniciar() {

    game.addVisual(self)

    self.iniciarAtaque()

  }

}