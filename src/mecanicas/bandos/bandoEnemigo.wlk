import src.mecanicas.direcciones.*

import src.gestores.gestorNaves.*
import src.gestores.gestorMuros.*
import src.gestores.gestorDisparos.*

import src.mecanicas.bandos.bando.*

object enemigo inherits Bando {
  override method gestor() = gestorEnemigos
  override method direccionDeDisparo() = abajo
  override method ajustarPosicion(posicion) = posicion.down(1)

  // El enemigo sabe a quién puede dispararle
  override method verificarColisionesDeDisparo(disparo, posicion) {
    gestorMuros.hayMuroEn(posicion, disparo)
    if (disparo.activo()) { gestorNaves.chocaDisparoEn(posicion, disparo) }
  }
}