import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.animacion.*

class Disparo {

  const recursoDeAnimacion
  const dano
  const bando
  var position
  const animacion = new Animacion(estado = self, recursoDeAnimacion = recursoDeAnimacion)

  method esProyectil(){
    return true
  }
  
  method image(){
    return animacion.frameActual()
  }

  method position(){
    return position
  }

  method bando(){
    return bando
  }

  // Mensaje necesario para el polimorfismo que usa animacion
  method terminoAnimacion() {
      self.avanzar()  // Se reproduce la aniamcion completa por celda
      if (animacion.activa()) animacion.reiniciar()   // la bala loopea mientras este viva
  }
  
  method iniciar() {
    game.addVisual(self)
    game.onCollideDo(self, { objetivo => self.colisionarCon(objetivo) })
  }
  
  // Avanza el disparo de celda
  method avanzar() {
    try {
      position = bando.direccion().siguiente(position)
    } catch e : DomainException {
      self.destruir()
    }
  }
  
  method colisionarCon(objetivo) {
    // 1. Evitamos colisionar con otras balas usando 'not objetivo.esProyectil()
    // 2. Evitamos el fuego aliado comparando los objetos bando directamente
    if (not objetivo.esProyectil() and objetivo.bando() != bando) {

      objetivo.recibirDano(dano)
      self.destruir()
      
    }
  }
  
  method destruir() {
    // El bando sabe exactamente a qué gestor llamar internamente
    bando.liberar(self)
    animacion.detener()
    if (game.hasVisual(self)) game.removeVisual(self)
  }

}