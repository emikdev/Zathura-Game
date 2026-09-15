import wollok.game.*
class Bala {

    var frameActual = 0
    var property position
    var property direction
    var property origen // "jugador" o "enemigo"

    method frames() // Metodo abstracto, es decir, cada subclase define sus imágenes

    // Getter que retorna la imagen correspondiente

	method image(){
        
        return self.frames().get(frameActual) 
        
    }

	method animar() {

		frameActual = (frameActual + 1) % self.frames().size() /* Se toma el nuemro de frame actual, se le suma 1 y se lo divide por el tamano de la lista, 
                                                    asegurandose de que no se salga de rango y pueda haber enemigos con distinta cantidad de frames de animacion */

	}

    method velocidad() = 200

    method desplazar() {
        position = direction.apply(position)
        self.estaFueraDePantalla().thenDo({self.destruir()})
    }

    method estaFueraDePantalla() {
        // Ajusta estos valores a las dimensiones de tu game.width() y game.height()
        return position.x() < 0 or position.x() >= game.width() 
            or position.y() < 0 or position.y() >= game.height()
    }
    
      method destruir() {
    //apagamos el reloj para evitar elementos fantasmas
    game.removeTickEvent(self) 
    game.removeVisual(self)
  }
  
}