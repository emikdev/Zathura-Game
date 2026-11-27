import src.personajes.personaje.*
import src.personajes.comportamiento.movimiento.travesia.*
import src.gestores.gestorDePuntos.*
import src.gestores.gestorOvnis.*
import src.gestores.reloj.*

class Ovni inherits Personaje {
  const comportamientoMovimiento

  method tick(deltaMs) {
    comportamientoMovimiento.tick(self, deltaMs)
  }

  override method estaEnFormacion() = false
  override method dejarFormacion() { } 

  override method alQuedarseSinVidas() {
    gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
  }

  override method detener() {
    comportamientoMovimiento.detener() 
    gestorOvnis.quitar(self)           
    super() // Llama al detener() de Personaje
  }
}