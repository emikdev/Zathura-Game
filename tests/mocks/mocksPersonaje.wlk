import wollok.game.*
import src.personajes.personaje.*
import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.mecanicas.bandos.*

/* Frames de una animación. La duración enorme evita que el temporizador
 de Animacion la avance sola durante un test. */
class RecursoMock {
  const frame
  method frames() = [frame]
  method duracion() = 1000000
}

class ArmaMock {
  var disparos = 0
  var tirador = null

  method disparar(personaje) {
    disparos += 1
    tirador = personaje
  }

  method disparos() = disparos
  method tirador() = tirador
}

class ArsenalMock {
  const arma
  var cambiosDeArma = 0
  var verificaciones = 0

  method armaActual() = arma
  method equiparSiguienteArma() { cambiosDeArma += 1 }
  method verificarArmaActual() { verificaciones += 1 }

  method cambiosDeArma() = cambiosDeArma
  method verificaciones() = verificaciones
}

class DisparoMock {
  const bando
  const dano
  var destruido = false

  method bando() = bando
  method dano() = dano
  method destruir() { destruido = true }

  method fueDestruido() = destruido
}

// Arma un personaje real con un tipo real y recursos mock.
object fabricaDePruebas {

  method saludMaxima() = 3
  method posicionInicial() = game.at(5, 5)

  method personaje(vidas, arsenal) {
    const tipo = new TipoPersonaje(
      saludMaxima = self.saludMaxima(),
      vidas = vidas,
      arsenalInicial = arsenal,
      animacionBase = new RecursoMock(frame = "base.png"),
      animacionDisparo = new RecursoMock(frame = "disparo.png"),
      animacionImpacto = new RecursoMock(frame = "impacto.png"),
      animacionMuerte = new RecursoMock(frame = "muerte.png")
    )
    return new Personaje(
      posicionInicial = self.posicionInicial(),
      tipoPersonaje = tipo,
      bando = jugador
    )
  }

  method prepararTablero(personaje) {
    game.width(20)
    game.height(20)
    game.addVisual(personaje)
  }
}