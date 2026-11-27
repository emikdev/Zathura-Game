import wollok.game.*

import src.mecanicas.animaciones.animacion.*
import src.sonidos.sonido.*
import src.gestores.reloj.*

class Disparo {
  const recursoAnimacion
  const dano
  const bando
  var position
  var animacion
  var activo = true // Consultar por roptura del encapsulamiento (creeria que es la unica forma) - emikdev

  method initialize() {
    animacion = new Animacion(
      estado = self,
      recursoDeAnimacion = recursoAnimacion,
      autoAvance = true
    )
  }

  method dano() = dano
  method image() = animacion.frameActual()
  method position() = position
  method bando() = bando
  
  // Agregado para que el bando pueda consultar si sigue vivo
  method activo() = activo // el flag activo se usa para el Double Dispatch (no seguir chequeando si ya chocó)

  method terminoAnimacion() {
    if (animacion.activa()) animacion.reiniciar()
  }

  method iniciar() {
    game.addVisual(self)
    sonido.reproducir("disparo2.mp3")
    reloj.registrar(self)
  }

  method tick(deltaMs) {
    if (activo) {
      const direccion = bando.direccionDeDisparo()
      const posicionFutura = direccion.siguiente(self.position())
      
      // El bando chequea colisiones (y puede destruir el disparo)
      bando.verificarColisionesDeDisparo(self, posicionFutura)
      
      // Si sobrevivió a los chequeos, avanza
      if (activo) {
        self.avanzar()
      }
    }
  }

  method avanzar() {
    const direccion = bando.direccionDeDisparo()

    if (direccion.puedeAvanzar(position)) {
      position = direccion.siguiente(position)
    } else {
      self.destruir()
    }
  }

  method colisionaCon(disparo) { }
  method colisionaConObjeto(objeto) { }

  method detener() {
    self.destruir()
  }

  method destruir() {
    activo = false
    reloj.olvidar(self) 
    bando.liberar(self)
    animacion.detener()
    if (game.hasVisual(self)) game.removeVisual(self)
  }
}