import src.mecanicas.direcciones.*

import src.gestores.gestorNiveles.*
import src.gestores.gestorMuros.*
import src.gestores.gestorOvnis.*
import src.gestores.gestorDisparos.*

import src.mecanicas.bandos.bando.*

object jugador inherits Bando {
  override method gestor() = gestorJugador
  override method direccionDeDisparo() = arriba
  override method ajustarPosicion(posicion) = posicion.up(1)
  override method esJugador() = true

  // El jugador sabe a quién puede dispararle
  override method verificarColisionesDeDisparo(disparo, posicion) {
    gestorNiveles.hayEnemigoEn(posicion, disparo)
    if (disparo.activo()) { gestorMuros.hayMuroEn(posicion, disparo) }
    if (disparo.activo()) { gestorOvnis.hayOvniEn(posicion, disparo) }
  }
}