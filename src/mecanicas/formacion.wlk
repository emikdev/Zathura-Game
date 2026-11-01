import wollok.game.*
import src.mecanicas.direcciones.*

// Grupo de enemigos que se mueve en bloque y ataca desde la primera línea.
class Formacion {

  const nivel // referencia al nivel al que pertenece
  const intervalo // ms entre cada paso de la formación
  const enemigos = []
  var direccion = derecha // direccion actual en la que se esta moviendo la formacion

  method agregar(enemigo) {
    enemigos.add(enemigo)
  }

  // Reloj

  method iniciar() {
    game.onTick(intervalo, self.nombreTick(), { self.paso() })
  }

  method detener() {
    game.removeTickEvent(self.nombreTick())
  }

  method nombreTick(){
    return  "formacion" + self.identity()
  }

  // Un paso del reloj: primero avanza, después ataca.
  method paso() {
    self.mover()
    self.atacar()
  }

  // Movimiento

  method mover() {
    if (self.todosPuedenAvanzar()) {
      enemigos.forEach({ enemigo => enemigo.mover(direccion) })
    } else {
      enemigos.forEach({ enemigo => enemigo.mover(abajo) })
      direccion = direccion.opuesta()
    }
  }

  method todosPuedenAvanzar() {
    return enemigos.all({ enemigo => direccion.puedeAvanzar(enemigo.position()) })
  }

  // Ataque

  method atacar() {
    self.enemigosEnPrimeraLinea().forEach({ enemigo => enemigo.intentarAtacar() })
  }

  method enemigosEnPrimeraLinea() {
    return enemigos.filter({ enemigo => self.estaAlFrente(enemigo) })
  }

  method estaAlFrente(enemigo) {
    return not enemigos.any({ otro =>
      otro.position().x() == enemigo.position().x() &&
      otro.position().y() < enemigo.position().y()
    })
  }

  // Fin de la vida de un enemigo

  method quitar(enemigo) {
    enemigos.remove(enemigo)
    if (enemigos.isEmpty()) {
      self.detener()
      nivel.llamarSiguienteFormacionSiSePuede()
    }
  }

}