import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.animacion.*

class Disparo {

  const recursoDeAnimacion // recursos de animacion del disparo
  const dano //  daño del arma que realiza el disparo
  const bando //  bando del personaje que diapra
  var position // posicion del personaje que dispara
  
  const animacion = new Animacion(estado = self, recursoDeAnimacion = recursoDeAnimacion)

  method dano(){
    return dano
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
    if (objetivo.bando() != bando) { 
      // Le pasamos el control al bando del objetivo
      objetivo.bando().recibirImpacto(objetivo, self) 
    }
  }
  
  method destruir() {
    // El bando sabe exactamente a qué gestor llamar internamente
    bando.liberar(self)
    animacion.detener()
    if (game.hasVisual(self)) game.removeVisual(self)
  }

}