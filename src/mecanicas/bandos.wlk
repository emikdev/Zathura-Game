import src.mecanicas.gestorDisparos.*
import src.mecanicas.direcciones.*

class Bando {
  // Método abstracto: cada bando debe definir cuál es su gestor específico
  method gestor()

  // Dirección y ajuste: definidos por cada bando
  method direccionDisparo()
  method ajustarPosicion(posicion)

  // Lógica compartida: se resuelve de forma genérica usando el gestor polimórfico
  method puedeDisparar() = self.gestor().puedeDisparar()
  
  method registrar(disparo) { 
    self.gestor().registrarDisparo(disparo) 
  }
  
  method liberar(disparo) { 
    self.gestor().liberarDisparo(disparo) 
  }

  // Lógica compartida de colisiones
  method puedeColisionarCon(otroBando) {
    return self != otroBando
  }
}

object jugador inherits Bando {
  // Atributos de recarga nativos del jugador
  override method gestor() = gestorJugador
  override method direccionDisparo() = arriba
  override method ajustarPosicion(posicion) = posicion.up(1)
}

object enemigo inherits Bando {
  override method gestor() = gestorEnemigos
  override method direccionDisparo() = abajo
  override method ajustarPosicion(posicion) = posicion.down(1)
}
