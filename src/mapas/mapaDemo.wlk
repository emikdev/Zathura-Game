import wollok.game.*
import src.personajes.naves.clases.naveBasica.*
import src.personajes.enemigos.fabricaEnemigos.*
import src.personajes.enemigos.tiposEnemigos.*
import src.mecanicas.comportamiento.formacion.*

// Objeto representativo del nivel de la Demo
object mapaDemo {

  const formacion = new Formacion(velocidad = 1)
  var juegoTerminado = false

  method formacion() = formacion

  method juegoTerminado() = juegoTerminado

  method cargar() {

    // 1. Iniciar nave del jugador y habilitar sus controles
    naveBasica.iniciar()

    // 2. Crear las 3 filas de la oleada clasica
    const enemigosDemo = []
    const columnas = [14, 16, 18]

    // Fila superior: Calamares (y = 15)
    // Fila intermedia: Aliens (y = 14)
    // Fila inferior: Pulpos (y = 13)
    columnas.forEach({ posX =>

      enemigosDemo.add(fabricaEnemigos.crear(calamar, game.at(posX, 15)))
      enemigosDemo.add(fabricaEnemigos.crear(alien, game.at(posX, 14)))
      enemigosDemo.add(fabricaEnemigos.crear(pulpo, game.at(posX, 13)))

    })

    // 3. Iniciar a cada enemigo en pantalla y activar su ciclo de ataque
    enemigosDemo.forEach({ enemigo => enemigo.iniciar() })

    // 4. Configurar la formacion con los enemigos e iniciar su ciclo de movimiento
    formacion.enemigos(enemigosDemo)
    formacion.iniciar()

    // 5. Iniciar monitoreo del estado de la partida
    self.iniciarMonitoreo()

  }

  // Monitorea periodicamente las condiciones de victoria y derrota
  method iniciarMonitoreo() {

    game.onTick(500, "monitor_partida_demo", {

      if (not juegoTerminado) {

        if (self.victoria()) {

          self.finalizar("¡VICTORIA! OLEADA INVASORA ELIMINADA")

        } else if (self.derrota()) {

          self.finalizar("GAME OVER - HAS SIDO DESTRUIDO")

        }

      }

    })

  }

  // Condicion de victoria: todos los enemigos de la oleada fueron eliminados
  method victoria() {

    return formacion.enemigosEnFormacion().isEmpty()

  }

  // Condicion de derrota: la nave se queda sin vidas o los enemigos invaden la linea de la nave
  method derrota() {

    return naveBasica.vidas() <= 0 or formacion.enemigosEnFormacion().any({ enemigo => enemigo.position().y() <= 1 })

  }

  // Finaliza la partida mostrando el mensaje correspondiente
  method finalizar(mensaje) {

    juegoTerminado = true

    try {

      game.removeTickEvent("monitor_partida_demo")

    } catch e : Exception {

      self.identity()

    }

    cartelFinPartida.mostrar(mensaje)

  }

}

// Cartel visual de fin de partida
object cartelFinPartida {

  var property text = ""
  var property position = game.at(12, 10)

  method mostrar(mensaje) {

    text = mensaje

    if (not game.hasVisual(self)) {

      game.addVisual(self)

    }

  }

}
