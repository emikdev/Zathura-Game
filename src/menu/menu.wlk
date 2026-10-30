  import src.mecanicas.direcciones.*
  import wollok.game.*
  import src.menu.seleccionador.*
  import src.menu.configuracion.*
  import src.menu.tiposNaves.*

  // falta importar el archivo de los niveles

  object menu {
    method iniciar() {
      self.menuPrincipal()
    }

    method mostrar(titulo, opciones, alSeleccionar) {
    self.mostrar(titulo, opciones, alSeleccionar, 4, 0)
  }
    // Arma una pantalla genérica: título + opciones + selector + teclas
    method mostrar(titulo, opciones, alSeleccionar,alturaFlecha,anchoFlecha) {
      game.clear()

      const seleccionador = new Seleccionador(
        opciones = opciones,
        alSeleccionar = alSeleccionar,
        alturaFlecha = alturaFlecha,
        anchoFlecha = anchoFlecha
      )

      game.addVisual(new Cartel(image = titulo, position = game.center().up(6).left(6)))
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
          if (opcion.valor() == "jugar") self.menuCantidadJugadores() else game.stop()
        }
      )
    }

    
  method menuCantidadJugadores() {
      self.mostrar(
        "cuantosJugadores.png",
        [
          new Opcion(image = "unJugador.png", valor = 1, position = game.center().left(10).down(4)),
          new Opcion(image = "dosJugadores.png" , valor = 2, position = game.center().right(-1).down(4))
        ],
        { opcion =>
          configuracion.cantidadJugadores(opcion.valor()) 
          configuracion.tiposNaves().clear()
          if(opcion.valor() == 1 ) self.menuUnJugador() else self.menuDosJugadores()
        }
      )
    }

    method menuUnJugador() {
      self.elegirNave("elegiTuNave.png", { tipoNaveP1 =>
        configuracion.tiposNaves().add(tipoNaveP1)
        self.menuDificultad()
      })
    }

  method menuDificultad() {
    self.mostrar(
      "elegiLaDificultad.png",
      [
        new Opcion(image = "easy.png", valor = 1, position = game.center().left(10).down(4)),
        new Opcion(image = "normal.png", valor = 2, position = game.center().down(4).left(5)),
        new Opcion(image = "hard.png", valor = 3, position = game.center().right(0).down(4))
      ],
      { opcion =>
        configuracion.dificultad(opcion.valor())
        self.empezar()
      }
    )
  }

    method menuDosJugadores() {
      self.elegirNave("jugador1ElegiTuNave.png", { tipoNaveP1 =>
        configuracion.tiposNaves().add(tipoNaveP1)

        self.elegirNave("jugador2ElegiTuNave.png", { tipoNaveP2 =>
          configuracion.tiposNaves().add(tipoNaveP2)

          configuracion.dificultad(3)   // en 2 jugadores la dificultad siempre es difcil
          self.empezar()
        })
      })
    }

    method menuGameOver (){

      self.menuInicial("perdiste.png")

    }

    method menuVictoria() {
      self.menuInicial("ganaste.png")
    }

    method menuInicial(titulo) {
      self.mostrar(titulo,
    [
      new Opcion(image = "volverAJugar.png", valor = "volver", position = game.center().left(10).down(4)),
      new Opcion(image = "salir.png",        valor = "salir",  position = game.center().right(-1).down(4))
    ],
    { opcion =>
      if (opcion.valor() == "volver") self.menuPrincipal() else game.stop()
    }
  )
    }

    method elegirNave(titulo, alElegir) {
      
        self.mostrar(titulo, self.opcionesNave(), {opcion => alElegir.apply(opcion.valor())} , 9 , 2)
    }

    method opcionesNave() {
  return [
    new Opcion(image = "naveTanqueMenu.png", valor = naveTanque, position = game.center().left(10).down(7)),
    new Opcion(image = "naveNormalMenu.png",       valor = nave,       position = game.center().down(7).left(3) ),
    new Opcion(image = "naveDeAtaqueMenu.png", valor = naveAtaque, position = game.center().right(3).down(7))
  ]
}

    method empezar() {
        game.clear()
        nivel.cargar()
    }

  }

