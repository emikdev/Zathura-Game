import wollok.game.*

class AtaqueEnemigo {
  var property image = "balas/alien_Frame1.png" // no funciona la carpeta bala me funciona directamente en assets
  var property position 
  var property proyectil = "tipo_normal"
  var property velocidad = 500 // Tiempo en milisegundos entre cada movimiento hacia abajo
  
  method iniciar() {
    game.addVisual(self)
    // utilizo el self como referencia para el evento de tick, así puedo eliminarlo
    game.onTick(velocidad, self, { self.caida() })
  }
  
  method caida() {
    // Mueve el proyectil hacia abajo
    position = position.down(1)
    if (position.y() < 0) {
      self.destruir()
    }
  }
  
  method destruir() {
    //apagamos el reloj para evitar elementos fantasmas
    game.removeTickEvent(self) 
    game.removeVisual(self)
  }
}
