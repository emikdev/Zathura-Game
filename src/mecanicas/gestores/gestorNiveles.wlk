import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.mecanicas.gestores.gestorBufos.*
import src.menu.menu.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tiposDeNaves.*
import src.mecanicas.gestores.gestorDePuntos.*

object gestorNiveles {

  var niveles = [nivelUno]
  var property contadorDeNiveles = 1

  method contadorDeNiveles() = contadorDeNiveles

  method iniciar() {
    niveles = [nivelUno] // Reinicia la lista para que funcione "Volver a jugar"
    contadorDeNiveles = 1
    generadorOvnis.iniciar()
    gestorBufos.iniciar()
    self.nivelActual().iniciar()
    gestorNaves.iniciar()
  }

  method nivelActual() {
    return niveles.first()
  }

  method removerNivelActual() {
    niveles.remove(self.nivelActual())
  }

  method haySiguienteNivel() {
    return not niveles.isEmpty()
  }

  method terminarNivel() {
    self.removerNivelActual()
    gestorBufos.detener()

    if (self.haySiguienteNivel()) {
      menu.menuEntreNiveles()
      gestorBufos.iniciar()
      contadorDeNiveles += 1
    } else {
      self.ganar()
    }
  }

  method ganar() {
    musicaInGame.detener()
    musicaVictoria.iniciar()
    generadorOvnis.detener()
    gestorBufos.detener()
    menu.menuVictoria()
  }

  method gameOver() {
    musicaInGame.detener()
    generadorOvnis.detener()
    gestorBufos.detener()
    menu.menuGameOver()
  }

  method mostrar() {
    const level = new Cartel(image = "lvl.png", position = game.at(0, game.height() - 1))
    game.addVisual(level)
    game.addVisual(contador)
  }

  method configuracionDemo() {
    configuracion.dificultadElegida(1)
    configuracion.tiposNaves().clear()
    configuracion.tiposNaves().addAll([naveNormal, naveTanque])
    configuracion.cantidadJugadores(2)

    self.contadorDeNiveles(0)
    niveles = [nivelDemo]
  }

  method iniciarDemo() {
    self.configuracionDemo()

    game.clear()
    musicaMenu.detener()
    gestorPuntaje.reiniciar()
    gestorPuntaje.mostrar()
    gestorNaves.iniciar()
    generadorOvnis.iniciar() // Agregado para que salgan ovnis en la demo
    gestorBufos.iniciar()    // Agregado para que caigan bufos en la demo
    self.mostrar()
    musicaInGame.iniciar()
    self.nivelActual().iniciar()
  }
}

object contador inherits Numero {
  override method position() = game.at(2, game.height() - 1)
  override method numero() = gestorNiveles.contadorDeNiveles()
}
