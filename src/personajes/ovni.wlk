import src.personajes.comportamiento.movimiento.travesia.*
import src.personajes.personaje.*
import src.gestores.gestorDePuntos.*
import src.gestores.reloj.*

class Ovni inherits Personaje {
  var comportamientoMovimiento

  method iniciarTravesia(travesia) {
    comportamientoMovimiento = travesia
    travesia.agregar(self)
  }

  method tick(deltaMs) {
    if (comportamientoMovimiento != null) {
      comportamientoMovimiento.tick(self, deltaMs)
    }
  }

  // El ovni no está en formación
  override method estaEnFormacion() = false

  // Como hereda de Personaje, al morir da sus puntos (TipoPersonajeOvni los tiene)
  override method alQuedarseSinVidas() {
    gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
  }

  method detener() {
    game.removeVisual(self)
    reloj.olvidar(self)
  }

  override method morir() {
    // Si muere, detenemos su movimiento
    comportamientoMovimiento.detener()
    super()
  }
}