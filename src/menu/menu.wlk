import src.gestores.gestorDisparos.*
import src.gestores.gestorDePuntos.*
import src.mecanicas.direcciones.*
import wollok.game.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tiposDeNaves.*
import src.gestores.gestorNiveles.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*
import src.menu.menus.menuPrincipal.*

  // falta importar el archivo de los niveles

  object menu {
    method iniciar() {
      menuPrincipal.iniciarMenu()
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

      seleccionador.controles()
    }


    method menuInicial(titulo) {
      self.mostrar(titulo,
    [
      new Opcion(image = "volverAJugar.png", valor = "volver", position = game.center().left(10).down(4)),
      new Opcion(image = "salir.png",        valor = "salir",  position = game.center().right(-1).down(4))
    ],
    { opcion =>
      if (opcion.valor() == "volver"){ 

        musicaVictoria.detener()
        menuPrincipal.iniciarMenu() 
      }else{ 
          game.stop()
      }
    }
  )
}

    method elegirNave(titulo, alElegir) {
      
        self.mostrar(titulo, self.opcionesNave(), {opcion => alElegir.apply(opcion.valor())} , 9 , 2)
    }

    method opcionesNave() {
  return [
    new Opcion(image = "naveTanqueMenu.png", valor = naveTanque, position = game.center().left(10).down(7)),
    new Opcion(image = "naveNormalMenu.png",       valor = naveNormal,       position = game.center().down(7).left(3) ),
    new Opcion(image = "naveDeAtaqueMenu.png", valor = naveAtaque, position = game.center().right(3).down(7))
  ]
}

    method empezar() {
        game.clear()
        musicaMenu.detener()
        // Se inicia el gestor de niveles
	      gestorNiveles.iniciar()
        // Se inicia el reloj que maneja el game
        reloj.iniciar()
        reloj.registrar(gestorOvnis)
        gestorPuntaje.mostrar()
        gestorNiveles.mostrar()
        musicaInGame.iniciar()
    }

  }

