import src.mecanicas.direcciones.*

import src.gestores.gestorNaves.*
import src.gestores.gestorMuros.*
import src.gestores.gestorDisparos.*

import src.mecanicas.bandos.bando.*

object enemigo inherits Bando {
  var bloqueo = false
  method activarBloqueo() { bloqueo = true }
  method desactivarBloqueo() { bloqueo = false }
  method estaBloqueado() { return bloqueo }
  override method puedeDisparar() = super() && !self.estaBloqueado()

  override method gestor() = gestorEnemigos
  override method direccionDeDisparo() = abajo
  override method ajustarPosicion(posicion) = posicion.down(1)

  // El enemigo sabe a quién puede dispararle
  override method verificarColisionesDeDisparo(disparo, posicion) {
    gestorNaves.chocaDisparoEn(posicion, disparo)
    gestorMuros.hayMuroEn(posicion, disparo)
  }
}