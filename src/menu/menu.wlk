import src.mecanicas.gestores.gestorDisparos.*
import src.mecanicas.gestores.gestorDePuntos.*
import src.mecanicas.direcciones.*
import wollok.game.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tiposDeNaves.*
import src.mecanicas.gestores.gestorNiveles.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*

object menu {
  method iniciar() {
    self.menuReglas()
  }

  method mostrar(titulo, opciones, alSeleccionar) {
    self.mostrar(titulo, opciones, alSeleccionar, 4, 0)
  }

  method mostrar(titulo, opciones, alSeleccionar, alturaFlecha, anchoFlecha) {
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

    seleccionador.controles()
  }
  
  method menuPrincipal() {
    game.boardGround("fondo.png")
    musicaMenu.iniciar()

    self.mostrar(
      "menuPrincipal.png",
      [
        new Opcion(image = "demo.png", valor = "demo", position = game.center().left(11).down(4)),
        new Opcion(image = "jugar.png", valor = "jugar", position = game.center().left(6).down(4)),
        new Opcion(image = "salir.png", valor = "salir", position = game.center().right(1).down(4))
      ],
      { opcion =>
        if (opcion.valor() == "jugar") {
          self.menuCantidadJugadores()
        } else if (opcion.valor() == "demo") {
          gestorNiveles.iniciarDemo()
        } else {
          game.stop()
        }
      }
    )
  }

  method menuControles() {
    game.clear()      
    musicaMenu.iniciar()
    game.boardGround("controles.png")
    keyboard.space().onPressDo({
      self.menuSistemaPuntajes()
      sonido.reproducir("choose.mp3")
    })
  }

  method menuReglas() {
    game.clear()      
    musicaMenu.iniciar()
    game.boardGround("reglas2.png")
    keyboard.space().onPressDo({
      self.menuControles()
      sonido.reproducir("choose.mp3")
    })
  }

  method menuSistemaPuntajes() {
    game.clear()
    musicaMenu.iniciar()
    game.boardGround("sistemaPuntajes.png")
    keyboard.space().onPressDo({
      self.menuPrincipal()
      sonido.reproducir("choose.mp3")
    })
  }

  method menuEntreNiveles() {
    game.clear()
    sonido.reproducir("levelPassed.mp3")
    game.boardGround("entreNiveles.png")
    keyboard.space().onPressDo({
      self.empezar()
      sonido.reproducir("choose.mp3")
    })
  }

  method menuCantidadJugadores() {
    self.mostrar(
      "cuantosJugadores.png",
      [
        new Opcion(image = "unJugador.png", valor = 1, position = game.center().left(10).down(4)),
        new Opcion(image = "dosJugadores.png", valor = 2, position = game.center().right(-1).down(4))
      ],
      { opcion =>
        configuracion.cantidadJugadores(opcion.valor()) 
        configuracion.tiposNaves().clear()
        if (opcion.valor() == 1) self.menuUnJugador() else self.menuDosJugadores()
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
        configuracion.dificultadElegida(opcion.valor())
        self.empezar()
      }
    )
  }

  method menuDosJugadores() {
    self.elegirNave("jugador1ElegiTuNave.png", { tipoNaveP1 =>
      configuracion.tiposNaves().add(tipoNaveP1)
      self.elegirNave("jugador2ElegiTuNave.png", { tipoNaveP2 =>
        configuracion.tiposNaves().add(tipoNaveP2)
        self.menuDificultad()
      })
    })
  }

  method menuGameOver() {
    musicaMenu.detener()
    self.menuInicial("perdiste.png")
    sonido.reproducir("fail.mp3")
  }

  method menuVictoria() {
    musicaMenu.detener()
    musicaVictoria.iniciar()
    self.menuInicial("ganaste.png")
  }

  method menuInicial(titulo) {
    self.mostrar(
      titulo,
      [
        new Opcion(image = "volverAJugar.png", valor = "volver", position = game.center().left(10).down(4)),
        new Opcion(image = "salir.png", valor = "salir", position = game.center().right(-1).down(4))
      ],
      { opcion =>
        if (opcion.valor() == "volver") { 
          musicaVictoria.detener()
          self.menuPrincipal() 
        } else { 
          game.stop()
        }
      }
    )
  }

  method elegirNave(titulo, alElegir) {
    self.mostrar(titulo, self.opcionesNave(), { opcion => alElegir.apply(opcion.valor()) }, 9, 2)
  }

  method opcionesNave() {
    return [
      new Opcion(image = "naveTanqueMenu.png", valor = naveTanque, position = game.center().left(10).down(7)),
      new Opcion(image = "naveNormalMenu.png", valor = naveNormal, position = game.center().down(7).left(3)),
      new Opcion(image = "naveDeAtaqueMenu.png", valor = naveAtaque, position = game.center().right(3).down(7))
    ]
  }

  method empezar() {
    game.clear()
    musicaMenu.detener()
    gestorNiveles.iniciar()
    gestorPuntaje.reiniciar()
    gestorPuntaje.mostrar()
    gestorNiveles.mostrar()
    musicaInGame.iniciar()
  }
}
