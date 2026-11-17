import src.sonidos.sonido.*
import wollok.game.*
import src.personajes.estados.estadoPersonaje.*
import src.personajes.efectos.efectosPersonaje.*
import src.personajes.estados.neutral.*

class Muriendo inherits EstadoPersonaje {

  override method initialize() {
    super()
    personaje.cambiarEfecto(sinEfecto)
    personaje.perderVida()
  }

  override method recursoAnimacion() {
    return personaje.animacionMuerte()
  }

  override method terminoAnimacion() {
    self.finalizarAnimacion()
    if (game.hasVisual(personaje)) game.removeVisual(personaje)
    if (personaje.tieneVidas()) {
      sonido.reproducir("pierdeVida.mp3")
      game.schedule(3000, { self.reaparecer() })
    } else {
      sonido.reproducir("muerteDefinitiva.mp3")
      personaje.alQuedarseSinVidas()
    }
  }

  method reaparecer() {
    personaje.restaurarSalud()
    personaje.position(personaje.posicionInicial())
    game.addVisual(personaje)
    self.cambiarANeutral()
  }

  override method mover(direccion) { }
  override method disparar() { }
  override method recibirImpacto(dano) { }
  override method siguienteArma() { }
  override method seleccionarArma(slot) { }
}
