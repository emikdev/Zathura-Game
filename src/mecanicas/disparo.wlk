import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.animacion.*

class Disparo {

  const recursoAnimacion
  const dano
  const bando
  var position
  var animacion
  var destruido = false

  method initialize() {
    animacion = new Animacion(estado = self, recursoDeAnimacion = recursoAnimacion)
  }

  method dano() = dano
  method image() = animacion.frameActual()
  method position() = position
  method bando() = bando

  method terminoAnimacion() {
    if (animacion.activa()) {
      animacion.reiniciar()
    }
  }

  method iniciar() {
    game.addVisual(self)
    self.verificarColisiones()
    if (!destruido) {
      game.onTick(recursoAnimacion.duracion(), self.nombreEventoTick(), {
        self.avanzar()
      })
    }
  }

  method nombreEventoTick() {
    return "movimientoDisparo_" + self.identity()
  }

  method avanzar() {
    const direccion = bando.direccionDeDisparo()

    if (direccion.puedeAvanzar(position)) {
      position = direccion.siguiente(position)
      self.verificarColisiones()
    } else {
      self.destruir()
    }
  }

  // Revisa colisiones solo en la celda actual sin dejar listeners en memoria
  method verificarColisiones() {
    //game.onCollideDo(self, { objetivo => objetivo.colisionaCon(self) })

    
    game.getObjectsIn(position).copy().forEach({ objetivo =>
      if (objetivo != self && !destruido) {
        objetivo.colisionaCon(self)
      }
    })
    
  }

  method colisionaCon(objetivo) { }
  method colisionaConMuro(muro) { }

  method destruir() {
    if (!destruido) {
      destruido = true
      game.removeTickEvent(self.nombreEventoTick())
      bando.liberar(self)
      animacion.detener()
      if (game.hasVisual(self)) game.removeVisual(self)
    }
  }
}
