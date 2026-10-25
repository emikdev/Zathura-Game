import src.mecanicas.direcciones.*
import wollok.game.*
import src.personajes.naves.clases.naveBasica.*
import src.mapas.mapaDemo.*
import src.mecanicas.menu.seleccionador.*
import src.mecanicas.menu.configuracion.*

object menu {
  method iniciar() {
    self.pantallaPrincipal()
  }

  // Arma una pantalla genérica: título + opciones + selector + teclas
  method mostrar(titulo, opciones, alSeleccionar) {
    game.clear()

    const seleccionador = new Seleccionador(
      opciones = opciones,
      alSeleccionar = alSeleccionar
    )

    game.addVisual(new Cartel(text = titulo, position = game.center().up(10)))
    opciones.forEach({ opcion => game.addVisual(opcion) })
    game.addVisual(seleccionador)

    keyboard.left().onPressDo({ seleccionador.anterior() })
    keyboard.right().onPressDo({ seleccionador.siguiente() })
    keyboard.a().onPressDo({ seleccionador.anterior() })
    keyboard.d().onPressDo({ seleccionador.siguiente() })
    keyboard.space().onPressDo({ seleccionador.selecciona() })
  }

  method pantallaPrincipal() {
    self.mostrar(
      "menuPrincipal.png",
      [
        new Opcion(image = "jugar.png", valor = "jugar", position = game.center().left(10).down(4)),
        new Opcion(image = "salir.png", valor = "salir", position = game.center().right(-1).down(4))
      ],
      { opcion =>
        if (opcion.valor() == "jugar") self.pantallaDificultad() else game.stop()
      }
    )
  }

method pantallaDificultad() {
  self.mostrar(
    "Elegi la dificultad",
    [
      new Opcion(image = "easy.png", valor = 1, position = game.center().left(10).down(4)),
      new Opcion(image = "normal.png", valor = 2, position = game.center().down(4).left(5)),
      new Opcion(image = "hard.png", valor = 3, position = game.center().right(0).down(4))
    ],
    { opcion =>
      configuracion.dificultad(opcion.valor())
      self.pantallaSkinsNave()
    }
  )
}

method pantallaSkinsNave() {
  
    self.mostrar(
      "Elegi tu nave",
      [
        new Aspecto(image = "naveRoja.png", position = game.center().left(3)),
        new Aspecto(image = "naveAzul.png", position = game.center().right(2))
      ],
      { aspecto =>
        naveBasica.image(aspecto.image()) // TODO: resolver esto, como settear en la nave la imagen elegida por el jugador.
        self.pantallaCantidadJugadores()
      }
    )
}

method pantallaCantidadJugadores() {
    self.mostrar(
      "Cuantos jugadores?",
      [
        new Opcion(image = "Unjugador.png", valor = 1, position = game.center().left(3)),
        new Opcion(image = "Dosjugadores.png", valor = 2, position = game.center().right(2))
      ],
      { opcion =>
        configuracion.cantidadJugadores(opcion.valor())
        game.clear()
        mapaDemo.cargar()
      }
    )
  }
}