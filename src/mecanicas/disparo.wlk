import wollok.game.*
import src.mecanicas.direcciones.*

class Disparo {

  // Datos recibidos de la Bala
  const frames
  const dano
  const velocidad

  // Estado propio del disparo definido por el personaje que lo originó
  var property position
  const direccion
  const bando

  // Creamos un String único para el evento del OnTick usando la identidad del objeto
  const idTick = "tick_disparo_" + self.identity().toString() // supuesta mente este identificador es mas especifico para usarlo en el observer quisas se cambie

  method bando() { 
    return bando 
  }

  method dano() { 
    return dano 
  }
  method velocidad() { 
    return velocidad 
  }
  method image() { 
    return frames.get(frameActual) 
  }
  
  // Agregamos este método para validar colisiones de forma limpia en Wollok
  method esDisparo() = true

  var frameActual = 0 

  method actualizar() {
    if (frameActual == frames.size() - 1) {
      frameActual = 0
      self.avanzar()
    } else {
      frameActual = frameActual + 1
    }
  }

  method iniciar() {
    game.addVisual(self)

    const duracionCelda = 1000 / velocidad
    const duracionFrame = duracionCelda / frames.size() 

    // SOLUCIÓN: Usamos 'idTick' (String único) en lugar de 'self'
    game.onTick(duracionFrame, idTick, {
      self.actualizar()
    })

    game.onCollideDo(self, { objetivo =>
      self.colisionarCon(objetivo)
    })
  }

  // Comprueba si la bala se encuentra dentro de los márgenes del juego
  method estaFueraDelTablero() {
    return position.x() < 0 
        or position.x() >= game.width() 
        or position.y() < 0 
        or position.y() >= game.height()
  }

  method avanzar() {
    try {
      position = direccion.siguiente(position)
    } catch e : Exception { 
      self.destruir()
    }
  }

  method colisionarCon(objetivo) {
    // Verificamos de forma segura si chocamos contra otra bala protegiendo el mensaje
    const esOtroDisparo = try { objetivo.esDisparo() } catch e : Exception { false }

    if (not esOtroDisparo) {
      if (objetivo.bando() != self.bando()) {
        objetivo.recibirDano(self.dano())
        self.destruir()
      }
    }
  }

  method destruir() {
    try {
      // Removemos el evento usando su String único identificador
      game.removeTickEvent(idTick)
    } catch e : Exception {
      // Evita problemas si el evento ya se había removido
    }

    if (game.hasVisual(self)) {
      game.removeVisual(self)
    }
  }
}


/*

  Todo objeto que exista en el juego debe entender bando() y recibirDano(dano), donde cada objeto se encarga de implementar que significa recibir dano para el.
  Todo objeto que tenga que disparar debe tener definido el metodo disaprar(): 
  
  method disparar(bala) {

    const nuevoDisparo = new Disparo(

      frames = bala.frames(),
      dano = bala.dano(),
      velocidad = bala.velocidad(),
      position = self.position().direccion(1),
      direccion = abajo,
      bando = personaje.bando()
      
    )

    nuevoDisparo.iniciar()

  }

*/