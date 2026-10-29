import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.animacion.*

class Disparo {

  const recursoDeAnimacion // recursos de animacion del disparo
  const dano //  daño del arma que realiza el disparo
  const bando //  bando del personaje que diapra
  var position // posicion del personaje que dispara
  

  
  // Declaramos la variable sin asignación inmediata para evitar el error 'undefined'
  var animacion 

  method initialize() {
    // Se instancia de forma segura una vez que 'recursoDeAnimacion' ya fue cargado
    animacion = new Animacion(estado = self, recursoDeAnimacion = recursoDeAnimacion)
  }

  method dano(){
    return dano
  }
  
  method image(){
    return animacion.frameActual()
  }

  method position(){
    return self.bando().ajustarPosicion(position)
  }

  method bando(){
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
    try {
      position = bando.direccionDisparo().siguiente(position)
    } catch e : Exception { 
      self.destruir()
    }
  }
  
  method colisionarCon(objetivo) {}
  
  method destruir() {
    // El bando sabe exactamente a qué gestor llamar internamente
    bando.liberar(self)
    animacion.detener()
    if (game.hasVisual(self)) game.removeVisual(self)
  }
}

//// Personaje
// method colisionaCon(disparo) {
//   if (bando.puedeColisonarCon(disparo)) {
//     self.recibirDano(disparo.dano())
//     disparo.destruir()
//   }
// }
