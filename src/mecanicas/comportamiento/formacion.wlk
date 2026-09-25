import wollok.game.*

import src.mecanicas.direcciones.*


// Representa una formacion de enemigos
class Formacion {

  // Enemigos que pertenecen a la formacion
  var property enemigos = []

  // Direccion horizontal actual
  var property direccion = derecha

  // Cantidad de celdas que completa la formacion por segundo.
  var property velocidad = 2

  // Indica si la formacion continua activa
  var activa = false


  // Iniciar ciclo de vida de la formacion
  method iniciar() {

    activa = true

    self.iniciarCiclo()

  }

  // Enemigos que siguen activos en la formacion
  method enemigosEnFormacion() {

    return enemigos.filter({ enemigo => enemigo.estaEnFormacion() })

  }

  // Implementacion del ciclo de movimiento

  method iniciarCiclo() {

    if (not activa) {

      return

    }

    const enemigosActivos = self.enemigosEnFormacion()

    // Si no quedan enemigos participando, la formacion termina.
    if (enemigosActivos.isEmpty()) {

      activa = false

      return

    }

    // Mayor velocidad = menor duracion del ciclo.
    const duracionCiclo = 1000 / velocidad

    // Cada enemigo comienza su propia animacion.
    enemigosActivos.forEach({ enemigo => enemigo.animarBase(duracionCiclo)})

    // Esperamos a que todos hayan completado
    // su animacion antes de mover la formacion.
    game.schedule(duracionCiclo, {

      if (activa) {

        self.moverFormacion()

      }

    })

  }

  // Movimiento de la formacion

  method moverFormacion() {

    const enemigosActivos = self.enemigosEnFormacion()

    if (enemigosActivos.isEmpty()) {

      activa = false

      return

    }

    var todosPuedenAvanzar = true


    // Primero verificamos que TODOS puedan avanzar.
    enemigosActivos.forEach({ enemigo =>

      try {

        direccion.siguiente(enemigo.position())

      } catch e : DomainException {

        todosPuedenAvanzar = false

      }

    })


    if (todosPuedenAvanzar) {

      // Si todos pueden avanzar, ahora movemos a todos.
      enemigosActivos.forEach({ enemigo =>

        enemigo.mover(direccion)

      })

    } else {

      // Si uno solo llego al borde, baja toda la formacion y cambia de direccion.
      self.bajarFormacion()

      self.cambiarDireccion()

    }


    self.iniciarCiclo()

  }

  // Bajar la formacion al llegar a un borde
  method bajarFormacion() {

    const enemigosActivos = self.enemigosEnFormacion()

    enemigosActivos.forEach({ enemigo =>

      enemigo.mover(abajo)

    })

  }

  // Cambiar de direccion la formacion
  method cambiarDireccion() {

    if (direccion == derecha) {

      direccion = izquierda

    } else {

      direccion = derecha

    }

  }

}