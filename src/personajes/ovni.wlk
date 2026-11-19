import src.personajes.comportamiento.movimiento.travesia.*
import src.personajes.personaje.*
import src.gestores.gestorDePuntos.*

class Ovni inherits Personaje {
  var comportamientoMovimiento = null

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
  override method salirDeFormacionSiCorresponde() { } 

  // Como hereda de Personaje, al morir da sus puntos (TipoPersonajeOvni los tiene)
  override method alQuedarseSinVidas() {
    gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
  }

  override method morir() {
    // Si muere, detenemos su movimiento
    if (comportamientoMovimiento != null) { comportamientoMovimiento.detener() }
    super()
  }
}