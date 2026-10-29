import src.mecanicas.direcciones.*
import wollok.game.*
import src.personajes.naves.clases.naveBasica.*
import src.mapas.mapaDemo.*
import src.mecanicas.menu.seleccionador.*
import src.mecanicas.menu.configuracion.*
import src.mecanicas.menu.tiposNave.*

// falta importar la factory.

object menu {
  method iniciar() {
    self.menuPrincipal()
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

  method menuPrincipal() {
    self.mostrar(
      "menuPrincipal.png",
      [
        new Opcion(image = "jugar.png", valor = "jugar", position = game.center().left(10).down(4)),
        new Opcion(image = "salir.png", valor = "salir", position = game.center().right(-1).down(4))
      ],
      { opcion =>
        if (opcion.valor() == "jugar") self.menuDificultad() else game.stop()
      }
    )
  }

method menuDificultad() {
  self.mostrar(
    "Elegi la dificultad",
    [
      new Opcion(image = "easy.png", valor = 1, position = game.center().left(10).down(4)),
      new Opcion(image = "normal.png", valor = 2, position = game.center().down(4).left(5)),
      new Opcion(image = "hard.png", valor = 3, position = game.center().right(0).down(4))
    ],
    { opcion =>
      configuracion.dificultad(opcion.valor())
      self.menuCantidadJugadores()
    }
  )
}


method menuCantidadJugadores() {
    self.mostrar(
      "Cuantos jugadores?",
      [
        new Opcion(image = "unjugador.png", valor = 1, position = game.center().left(10).down(4)),
        new Opcion(image = "dosJugadores.png" , valor = 1, position = game.center().right(-1).down(4))
      ],
      { opcion =>
        configuracion.cantidadJugadores(opcion.valor()) // TODO: Implementar que se pueda jugar de a 2.
        self.menuUnJugador()
      }
    )
  }

  method menuUnJugador() {
  
    self.mostrar(
      "Elegi tu nave",
      [
        new Opcion(image = "naveNautilus.png", valor = naveTanque, position = game.center().left(10).down(4)),
        new Opcion(image = "batiNave.png",     valor = naveAtaque, position = game.center().down(4).left(5)),
        new Opcion(image = "nave.png",         valor = nave,       position = game.center().right(0).down(4))
      ],
      { opcion =>
        factory.crear(opcion.valor())   // contrato: factory.crear(tipoDeNaveElegida)
        game.clear()
        mapaDemo.cargar()
      }
    )
}


  method menuDosJugadores() {

    self.menuUnJugador() // TO DO: implementar esto.

}

}