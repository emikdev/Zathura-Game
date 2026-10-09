import src.mecanicas.gestorDisparos.*
import src.mecanicas.direcciones.*

object bandoJugador {
  method nombre() = "jugador"
  method direccionDisparo() = arriba 
  
  method puedeDisparar() = gestorDisparos.puedeDisparar(self)
  method registrar(disparo) { gestorDisparos.registrarDisparo(disparo, self) }
  method liberar(disparo)   { gestorDisparos.liberarDisparo(disparo, self) }
}

object bandoEnemigo {
  method nombre() = "enemigo"
  method direccionDisparo() = abajo 
  
  method puedeDisparar() = gestorDisparos.puedeDisparar(self)
  method registrar(disparo) { gestorDisparos.registrarDisparo(disparo, self) }
  method liberar(disparo)   { gestorDisparos.liberarDisparo(disparo, self) }
}
