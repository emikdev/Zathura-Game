import src.mecanicas.gestores.gestorDisparos.*
import src.mecanicas.direcciones.*

object bandoJugador {
  const tiempoRecarga = 500 
  var listoParaDisparar = true

  method nombre() = "jugador"
  method direccionDisparo() = arriba 
  
  // Usa su gestor específico
  method puedeDisparar() = listoParaDisparar and gestorJugador.puedeDisparar()

  method registrar(disparo) { 
    gestorJugador.registrarDisparo(disparo)
    self.iniciarCooldown()
  }

  method liberar(disparo) { gestorJugador.liberarDisparo(disparo) }

  method iniciarCooldown() {
    listoParaDisparar = false
    game.schedule(tiempoRecarga, { listoParaDisparar = true })
  }
}

object bandoEnemigo {
  method nombre() = "enemigo"
  method direccionDisparo() = abajo 
  
  // Usa su gestor específico
  method puedeDisparar() = gestorEnemigos.puedeDisparar()
  method registrar(disparo) { gestorEnemigos.registrarDisparo(disparo) }
  method liberar(disparo)   { gestorEnemigos.liberarDisparo(disparo) }
}
