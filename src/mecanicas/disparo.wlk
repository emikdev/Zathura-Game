import wollok.game.*
import src.mecanicas.direcciones.*

class Disparo {
  var property position  // Pasar la posición del objeto que dispara (up(1) para la nave, down(1) para los enemigos)
  var property origen     // Atributo que guarda quién realizó el disparo (self)
  var property direccion  // Indica que recibe los objetos polimórficos (arriba o abajo)
  var property bala       // Recibimos el objeto bala para poder extraer los datos de la misma       
  
  var frameActual = 0

  method velocidad() = bala.velocidad() // Velocidad en milisegundos que se le delega a la bala

  method damage() {
    return bala.damage() // Delega la consulta del daño a la bala configurada
  }

  method image() {
    return bala.frames().get(frameActual) // Obtiene la imagen actual según el frame de la animación
  }

  method animar() {
    // Si la lista tiene elementos, calcula el siguiente frame de forma circular evitando desbordes
    if (not bala.frames().isEmpty()) {
      frameActual = (frameActual + 1) % bala.frames().size()
    }
  }

  method iniciar() {
    game.addVisual(self)
    // Usamos el self como identificador del tick. 
    // Además de avanzar, hacemos que se anime en cada movimiento.
    game.onTick(self.velocidad(), self, { 
      self.avanzar() 
      self.animar() 
    })
  }
  
  method avanzar() {
    try {
      position = direccion.siguiente(position)
    } catch e : DomainException {
      // Captura el error de límite del mapa de Wollok Game y gestiona la autodestrucción al salir
      self.destruir()
    }
  }
  
  method destruir() {
    try {
      game.removeTickEvent(self) // Apago el reloj usando el identificador 'self'
    } catch e : Exception { 
    /* 
      Evita el Crash por Concurrencia: En el juego, dos eventos pueden pasar exactamente al mismo tiempo.
      Si la bala sale de la pantalla, llama a destruir(). Pero si en ese mismo instante un enemigo choca 
      contra ella, el sistema de colisiones también llamará a destruir().
      Esto previene el fallo ya que en Wollok no hay un método nativo para saber si un tick sigue activo.
    */
    }
    if (game.hasVisual(self)) game.removeVisual(self)
  }
}

// Como utilizar la clase disparo en la nave o enemigo 
// method disparar() {
//   // 1. Elegimos qué tipo de bala queremos disparar
//   const tipoBala = new BalaDoble() 

//   // 2. Creamos el Disparo pasándole la posición inicial y la bala elegida
//   const nuevoDisparo = new Disparo(
//     position = self.position().up(1), 
//     origen = self,                    
//     direccion = arriba,
//     bala = tipoBala                  // <--- Inyección de dependencia
//   )
  
//   // 3. Lo iniciamos en el juego
//   nuevoDisparo.iniciar()
// }