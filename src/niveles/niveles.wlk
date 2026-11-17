import src.niveles.oleada.*
import src.niveles.nivel.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*

const nivelDemo = new Nivel(oleadas = [
  new Oleada(
    intervalo = 800,
    disposicion =
      disposiciones.fila(pulpo,           disposiciones.alturaDesdeArriba(1), 2, 1, 1) +
      disposiciones.fila(calamar,         disposiciones.alturaDesdeArriba(1), 4, 1, 1) +
      disposiciones.fila(alien,           disposiciones.alturaDesdeArriba(1), 6, 1, 1) +
      disposiciones.fila(sepia,           disposiciones.alturaDesdeArriba(1), 8, 1, 1) +
      disposiciones.fila(abeja,           disposiciones.alturaDesdeArriba(1), 10, 1, 1) +
      disposiciones.fila(kamikaze,        disposiciones.alturaDesdeArriba(1), 12, 1, 1) +
      disposiciones.fila(mosca,           disposiciones.alturaDesdeArriba(1), 14, 1, 1) +
      disposiciones.fila(medusa,          disposiciones.alturaDesdeArriba(3), 2, 1, 1) +
      disposiciones.fila(calamarAmarillo, disposiciones.alturaDesdeArriba(3), 4, 1, 1) +
      disposiciones.fila(alienAzul,       disposiciones.alturaDesdeArriba(3), 6, 1, 1) +
      disposiciones.fila(pulpoRojo,       disposiciones.alturaDesdeArriba(3), 8, 1, 1) +
      disposiciones.fila(calamarHeavy,    disposiciones.alturaDesdeArriba(3), 10, 1, 1) +
      disposiciones.fila(alienHeavy,      disposiciones.alturaDesdeArriba(3), 12, 1, 1) +
      disposiciones.fila(pulpoHeavy,      disposiciones.alturaDesdeArriba(3), 14, 1, 1)
  )
])

const nivelUno = new Nivel(oleadas = [
  new Oleada(
    intervalo = 800,
    disposicion =
      disposiciones.filaCentrada(pulpo,   disposiciones.alturaDesdeArriba(1), 3, 1) +
      disposiciones.filaCentrada(calamar, disposiciones.alturaDesdeArriba(2), 3, 2) +
      disposiciones.filaCentrada(alien,   disposiciones.alturaDesdeArriba(3), 3, 1)
  )
])
