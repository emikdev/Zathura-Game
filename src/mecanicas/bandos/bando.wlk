import src.gestores.gestorDisparos.*
import src.mecanicas.direcciones.*

class Bando {
  // Método abstracto: cada bando debe definir cuál es su gestor específico
  method gestor()

  // Dirección y ajuste: definidos por cada bando
  method direccionDeDisparo() { }
  method ajustarPosicion(posicion) { }

  // Lógica compartida: se resuelve de forma genérica usando el gestor polimórfico
  method puedeDisparar() = self.gestor().puedeDisparar()
  method registrar(disparo) = self.gestor().registrarDisparo(disparo)
  method liberar(disparo) = self.gestor().liberarDisparo(disparo)

  // Lógica compartida de colisiones
  method puedeColisionarCon(otroBando) = self != otroBando

  method esJugador() = false

  // Contrato para que cada bando busque colisiones
  method verificarColisionesDeDisparo(disparo, posicion) { }
}