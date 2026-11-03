import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.animacion.*

class Disparo {

  const recursoAnimacion // frames y duración de la bala; la Animacion la crea el propio disparo
  const dano             // daño del arma que realiza el disparo
  const bando            // bando del personaje que dispara
  var position           // posición del personaje que dispara
  var animacion

  method initialize() {
    position = bando.ajustarPosicion(position)   // se ajusta UNA sola vez
    animacion = new Animacion(estado = self, recursoDeAnimacion = recursoAnimacion)
  }

  method dano() {
    return dano
  }

  method image() {
    return animacion.frameActual()
  }

  method position() {
    return position
  }

  method bando() {
    return bando
  }

  method terminoAnimacion() {
    self.avanzar()
    if (animacion.activa()) animacion.reiniciar()
  }

  method iniciar() {
    game.addVisual(self)
    game.onCollideDo(self, { objetivo => objetivo.colisionaCon(self) })
  }

  // Avanza el disparo de celda
  method avanzar() {
    const direccion = bando.direccionDeDisparo()

    if (direccion.puedeAvanzar(position)) {
      position = bando.direccionDeDisparo().siguiente(position)
    } else {
      self.destruir()
    }
  }

  method colisionaCon(objetivo) {}

  method destruir() {
    // El bando sabe exactamente a qué gestor llamar internamente
    bando.liberar(self)
    animacion.detener()
    if (game.hasVisual(self)) game.removeVisual(self)
  }
}