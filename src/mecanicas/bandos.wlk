import src.mecanicas.gestorDisparos.*
import src.mecanicas.direcciones.*

object jugador {
  const tiempoRecarga = 500
  var listoParaDisparar = true 
  // ajuste en la posicion del disparo
  method ajustarPosicion(posicion) = posicion.up(1)
  
  method direccionDisparo() = arriba
  
  // Usa su gestor específico
  method puedeDisparar() = listoParaDisparar and gestorJugador.puedeDisparar()
  
  
  method registrar(disparo) {
    gestorJugador.registrarDisparo(disparo)
    self.iniciarCooldown()
  }
  
  method liberar(disparo) {
    gestorJugador.liberarDisparo(disparo)
  }
  method puedeColisonarCon(objeto){
    return self != objeto
  }
  method iniciarCooldown() {
    listoParaDisparar = false
    game.schedule(tiempoRecarga, { listoParaDisparar = true })
  }
}

object enemigo {
  method direccionDisparo() = abajo
  // ajuste en la posicion del disparo
  method ajustarPosicion(posicion) = posicion.down(1)
  
  // Usa su gestor específico
  method puedeDisparar() = gestorEnemigos.puedeDisparar()
  
  method registrar(disparo) {
    gestorEnemigos.registrarDisparo(disparo)
  }

  method puedeColisonarCon(objeto){
    return self != objeto
  }

  method liberar(disparo) {
    gestorEnemigos.liberarDisparo(disparo)
  }
}