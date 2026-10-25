import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.animacion.*

class Disparo {

  const recursoDeAnimacion
  const dano
  const velocidad
  const bando
  var position
  var animacion
  var activo = true
  
  method initialize() {
    animacion = new Animacion(estado = self /* Polimorfismo: Se utiliza el disparo como estado */, recursoDeAnimacion = recursoDeAnimacion)
  }

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
      self.avanzar()
      animacion.reiniciar()   // la bala loopea mientras este viva
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
    if (activo and not objetivo.esProyectil() and objetivo.bando() != bando) {

      objetivo.recibirDano(dano)
      self.destruir()
      
    }
  }
  
  method destruir() {
    if (activo) {
        activo = false
        bando.liberar(self)
        animacion.detener()
        if (game.hasVisual(self)) game.removeVisual(self)
    }
  }
  
}