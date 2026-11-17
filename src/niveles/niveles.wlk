import src.niveles.nivel.*
import src.niveles.disposicion.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*

const nivelUno = new Nivel(
  formaciones = [
    new Disposicion(filas = [
      fila.de(pulpo, 3),
      fila.separada(calamar, 3),
      fila.de(alien, 3)
    ]),
    new Disposicion(filas = [
      fila.separada(alien, 3),
      fila.de(calamar, 3),
      fila.separada(pulpo, 3)
    ]),
    new Disposicion(filas = [
      fila.de(cangrejoAmarillo, 1)
    ])
  ]
)

const nivelDos = new Nivel(
  formaciones = [
    new Disposicion(filas = [
      fila.de(alien, 3),
      fila.separada(alienHeavy, 2),
      fila.de(alien, 3)
    ]),
    new Disposicion(filas = [
      fila.de(calamar, 3),
      fila.separada(calamarHeavy, 2),
      fila.de(calamar, 3)
    ]),
    new Disposicion(filas = [
      fila.de(pulpo, 3),
      fila.separada(pulpoHeavy, 2),
      fila.de(pulpo, 3)
    ]),
    new Disposicion(filas = [
      fila.separada(cangrejoAzul, 1)
    ])
  ]
)

const nivelTres = new Nivel(
  formaciones = [
    new Disposicion(filas = [
      fila.de(abeja, 3),
      fila.separada(mosca, 3),
      fila.separada(kamikaze, 3)
    ]),
    new Disposicion(filas = [
      fila.de(medusa, 3),
      fila.separada(sepia, 3),
      fila.separada(kamikaze, 3)
    ]),
    new Disposicion(filas = [
      fila.de(cangrejoAzul, 1)
    ])
  ]
)

const nivelCuatro = new Nivel(
  formaciones = [
    new Disposicion(filas = [
      fila.de(alien, 3),
      fila.separada(alienAzul, 2),
      fila.de(alien, 3)
    ]),
    new Disposicion(filas = [
      fila.de(calamar, 3),
      fila.separada(calamarAmarillo, 2),
      fila.de(calamar, 3)
    ]),
    new Disposicion(filas = [
      fila.de(pulpo, 3),
      fila.separada(pulpoRojo, 2),
      fila.de(pulpo, 3)
    ])
  ]
)
