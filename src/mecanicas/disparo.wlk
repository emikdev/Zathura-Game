import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animador.*
import src.mecanicas.gestorDisparos.*

class Disparo {
  const property animacion
  const property dano
  const property velocidad
  const property bando
  var property position
  const direccion = bando.direccionDisparo()
  
  method esProyectil() = true
  
  method image() = animacion.imagenActual()
  
  // Actualiza el estado del disparo en cada tick
  method actualizar() {
    // Lógica directa: avanza el frame del animador en cada latido
    const llegoAlFinal = animacion.avanzarFrame()
    // Cuando completa el recorrido de la lista de frames, avanza de celda física
    if (llegoAlFinal) {
      self.avanzar()
      animacion.reiniciar()
    }
  }
  
  method iniciar() {
    game.addVisual(self)
    game.onCollideDo(self, { objetivo => self.colisionarCon(objetivo) })
    
    // El cálculo del tiempo ahora es puramente la velocidad de la animación por frame
    const duracionCelda = 1000 / velocidad
    const duracionFrame = duracionCelda / animacion.frames().size()
    
    // Usamos un ID de texto único para el onTick en Wollok
    game.onTick(
      duracionFrame,
      "tick_disparo_" + self.identity().toString(),
      { self.actualizar() }
    )
  }
  
  method avanzar() {
    // Avanza el movimiento del disparo
    try {
      position = direccion.siguiente(position)
    } catch e : DomainException {
      self.destruir()
    }
  }
  
  method colisionarCon(objetivo) {
    // 1. Evitamos colisionar con otras balas usando 'not objetivo.esProyectil()'
    // 2. Evitamos el fuego aliado comparando los objetos bando directamente
    if ((objetivo.bando() != bando) and (not objetivo.esProyectil())) {
      objetivo.recibirDano(dano)
      self.destruir()
    }
  }
  
  method destruir() {
    // El bando sabe exactamente a qué gestor llamar internamente
    bando.liberar(self)
    
    if (game.hasVisual(self)) game.removeVisual(self)
    
    try {
      // Removemos el evento usando el mismo ID único de texto
      game.removeTickEvent("tick_disparo_" + self.identity().toString())
    } catch e : Exception {
      
      // Evita problemas si el evento ya fue eliminado
    }
  }
}