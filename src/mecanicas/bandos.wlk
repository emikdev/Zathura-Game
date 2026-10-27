import src.mecanicas.gestorDisparos.*
import src.mecanicas.direcciones.*

class Bando { // clase abstracta para bandos
  method gestor()
  
  method recibirImpacto(objetivo, disparo) {
    // Si el objetivo NO está en la lista de disparos activos de este bando, 
    // significa que el disparo golpeó a un personaje real de este bando.
    if (not self.gestor().disparosActivos().contains(objetivo)) {
      objetivo.recibirDano(disparo.dano())
      disparo.destruir()
    }
    // Si SÍ estaba en la lista, el 'if' no hace nada, logrando que se atraviesen.
  }
}


object jugador inherits Bando{
  const tiempoRecarga = 500 
  var listoParaDisparar = true

  method direccionDisparo() = arriba 
  
  // Usa su gestor específico
  method puedeDisparar() = listoParaDisparar and gestorJugador.puedeDisparar()

  override method gestor() = gestorJugador

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

object enemigo inherits Bando{
  method direccionDisparo() = abajo 
  override method gestor() = gestorEnemigos
  // Usa su gestor específico
  method puedeDisparar() = gestorEnemigos.puedeDisparar()
  method registrar(disparo) { gestorEnemigos.registrarDisparo(disparo) }
  method liberar(disparo)   { gestorEnemigos.liberarDisparo(disparo) }
}
