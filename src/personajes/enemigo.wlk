import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.mecanicas.formacion.*
import src.personajes.personaje.*
import src.mecanicas.direcciones.*
import src.gestores.gestorDePuntos.*
import src.gestores.gestorNaves.*
import src.gestores.gestorMuros.*
import src.gestores.reloj.*
import src.personajes.comportamiento.movimiento.movimientoEnFormacion.*
import src.personajes.comportamiento.movimiento.movimientoKamikaze.*

class Enemigo inherits Personaje {
  const formacion
  var comportamientoMovimiento = movimientoEnFormacion

  method intentarAtacar() = tipoPersonaje.comportamientoAtaque().actuar(self)
  method seleccionarArma(slot) { estadoActual.seleccionarArma(slot) }

  override method mover(direccion) {
    super(direccion) // Llama al mover() de Personaje, que actualiza la posición
    gestorMuros.chocaEnemigoEn(self.position(), self) // Verifica si pisó un muro
  }

  override method alQuedarseSinVidas() {
    formacion.olvidarEnemigoLibre(self)
    formacion.quitar(self)
    gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
  }

  override method estaEnFormacion() = true

  override method dejarFormacion() {
    formacion.sacarDeLista(self)
  }
  
  method inmolarse() {
    self.dejarFormacion()
    formacion.registrarEnemigoLibre(self)
    comportamientoMovimiento = new MovimientoKamikaze(intervalo = formacion.intervalo())
    reloj.registrar(self)
  }

  // El Reloj llama a este tick
  method tick(deltaMs) {
    comportamientoMovimiento.tick(self, deltaMs)
  }

  // Movimiento físico del kamikaze
  method avanzarKamikaze() {
    if (abajo.puedeAvanzar(self.position())) {
      self.mover(abajo) 
      
      // Solo chequeamos las naves, porque los muros ya se chequean dentro de mover()
      gestorNaves.chocaKamikazeEn(self.position(), self) 
      
    } else {
      self.terminarInmolacion()
    }
  }
  method terminarInmolacion() {
    self.morir()
  }

  override method morir() {
    reloj.olvidar(self)
    super()
  }
}
