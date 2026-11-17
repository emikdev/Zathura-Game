import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.mecanicas.gestores.gestorDisparos.*
import src.menu.menu.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tiposDeNaves.*
import src.mecanicas.gestores.gestorDePuntos.*
import src.mecanicas.gestores.gestorBufos.*

object gestorNiveles {

  const nivelesDelJuego = [nivelUno, nivelDos, nivelTres, nivelCuatro]
  var niveles = nivelesDelJuego
  var indice = 0
  var property contadorDeNiveles = 1

  method iniciar() {
    game.boardGround("fondo.png")
    generadorOvnis.iniciar()
    self.nivelActual().iniciar()
    gestorNaves.iniciar()
    gestorBufos.iniciar()
  }

  method nivelActual() {
    return niveles.get(indice)
  }

  method haySiguienteNivel() {
    return indice < niveles.size() - 1
  }

  method limpiarEstadoDeJuego() {
    gestorJugador.limpiar()
    gestorEnemigos.limpiar()
    gestorBufos.detener()
    generadorOvnis.detener()
  }

  method terminarNivel() {
    self.limpiarEstadoDeJuego()
    if (self.haySiguienteNivel()) {
      indice += 1
      contadorDeNiveles += 1
      musicaInGame.detener()
      menu.menuEntreNiveles()
    } else {
      self.ganar()
    }
  }

  method reiniciar() {
    niveles = nivelesDelJuego
    indice = 0
    contadorDeNiveles = 1
  }

  method ganar() {
    self.limpiarEstadoDeJuego()
    musicaInGame.detener()
    musicaVictoria.iniciar()
    menu.menuVictoria()
    self.reiniciar()
  }

  method gameOver() {
    self.limpiarEstadoDeJuego()
    musicaInGame.detener()
    menu.menuGameOver()
    self.reiniciar()
  }

  method mostrar() {
    const level = new Cartel(image = "lvl.png", position = game.at(0, game.height() - 1))
    game.addVisual(level)
    game.addVisual(contador)
  }

}

object contador inherits Numero {
  override method position() = game.at(2, game.height() - 1)
  override method numero() = gestorNiveles.contadorDeNiveles()
}
