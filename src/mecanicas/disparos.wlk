import wollok.game.*
import mecanicas.direcciones.*

class Disparo {
  var property position // pasar la posicion del objeto que dispara (up(1) para la nave,down(1) para los enemigos)
  var property velocidad = 1000  // Contiene la aclaración sobre el tiempo en milisegundos y la posibilidad de cambiarlo por parámetro
  var property origen // Es el atributo que guarda quién realizó el disparo (self)
  var property image // Explica cómo cambiar el aspecto del proyectil pasando otra imagen
  var property direccion // Indica que recibe los objetos polimórficos (arriba o abajo).
  
  method iniciar() {
    game.addVisual(self)
    // utilizo el self como identificador del tick
    game.onTick(velocidad, self, { self.avanzar() })
  }
  
  //Contiene la estructura de control try-catch con la captura de la DomainException para gestionar la autodestrucción al salir del mapa.
  method avanzar() {
    // esto sirve para atrapar el error que dispara validarDentro de direcciones 
    try {
      position = direccion.siguiente(position)
    } catch e : DomainException {
      // Atrapamos únicamente el error de límite/dominio de Wollok Game
      // Evitamos que la pantalla se congele y gestionamos la autodestrucción
      self.destruir()
    }
  }
  
  /*Bloque final que apaga el reloj bajo el escudo de protección contra la concurrencia simultánea (catch e : Exception) 
   y remueve el visual de la pantalla. */
  method destruir() {
    try {
      game.removeTickEvent(self) // Apago el reloj usando el identificador 'self'
    } catch e : Exception { 
    /* 
      Evita el Crash por Concurrencia: juego, dos eventos pueden pasar exactamente al mismo tiempo (en el mismo milisegundo).
      Si la bala sale de la pantalla, llama a destruir(). 
      Pero si en ese mismo instante un enemigo choca con la bala,en colisiones (Ticket 004) también va a llamar a destruir()
      mas que anda por que en wollok o por lo que busuqe no hay una manera de saber si un tick sigue activo
    */
    }
    
    if (game.hasVisual(self)) game.removeVisual(self)
  }
}

