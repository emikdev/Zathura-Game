import src.mecanicas.bandos.bando.*
import src.mecanicas.direcciones.*

object neutral inherits Bando {
  override method gestor() { }
  override method direccionDeDisparo() { }
  override method ajustarPosicion(posicion) { }
  
  // Los neutrales no chequean colisiones de disparos ya que no disparan
  override method verificarColisionesDeDisparo(disparo, posicion) { }
}