import src.mecanicas.direcciones.*

import src.personajes.estados.neutral.*
import src.personajes.estados.disparando.*
import src.personajes.estados.muriendo.*

import src.mecanicas.animaciones.animacion.*
import src.personajes.efectos.efectoImpacto.*

import src.gestores.reloj.*

class EstadoPersonaje {
  const personaje
  var animacion

  method initialize() {
    animacion = new Animacion(
      estado = self,
      recursoDeAnimacion = self.recursoAnimacion(),
      autoAvance = self.autoAvanceAnimacion()
    )
  }

  method recursoAnimacion()
  method autoAvanceAnimacion() = true
  method prepararPaso() { }
  method terminoAnimacion()

  method imagenActual() = animacion.frameActual()

  method finalizarAnimacion() {
    animacion.detener()
  }

  method mover(direccion) {
    personaje.position(direccion.siguiente(personaje.position()))
  }

  method cambiarANeutral() {
    personaje.cambiarEstado(new Neutral(personaje = personaje))
  }

  method disparar() {
    personaje.cambiarEstado(new Disparando(personaje = personaje))
  }

  method recibirImpacto(dano) {
    personaje.restarSalud(dano)
    if (personaje.sinSalud()) {
      personaje.cambiarEstado(new Muriendo(personaje = personaje))
    } else {
      personaje.cambiarEfecto(new EfectoImpacto(personaje = personaje))
    }
  }

  method siguienteArma() { personaje.arsenal().equiparSiguienteArma() }
  method seleccionarArma(slot) { personaje.arsenal().equiparArma(slot) }
  
  method esMuriendo() = false

  method detener() {
    self.finalizarAnimacion()
    reloj.olvidar(self)
  }

  method reactivarAnimacion() {
    animacion.reactivar()
  }

}