import src.niveles.nivel.*
import src.niveles.disposicion.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*

/*
  CÓMO DISEÑAR UN NIVEL

  Un nivel es una lista de formaciones. Cada formación se diseña con una Disposicion:

    new Disposicion(
        intervalo = 500,                // opcional (800 por defecto): ms entre pasos; menos = más rápida
        filas = [                       // de arriba hacia abajo; cada fila se centra sola
            fila.de(pulpo, 3),              3 pulpos juntos
            fila.separada(calamar, 3),      3 calamares con una celda libre entre cada uno
            fila.mezcla([alien, abeja])     enemigos de distintos tipos, juntos
        ]
    )

  Para otra separación entre enemigos: new FilaDeEnemigos(tipos = [alien, alien], separacion = 4)

  Cuando el jugador destruye una formación entera empieza la siguiente de la lista.

  Ejemplo de un nivel con dos formaciones (la segunda, más rápida):

    const nivelDos = new Nivel(
        formaciones = [
            new Disposicion(filas = [
                fila.de(calamar, 5),
                fila.de(alien, 5)
            ]),
            new Disposicion(intervalo = 500, filas = [
                fila.separada(pulpo, 4),
                fila.de(medusa, 7)
            ])
        ]
    )
*/

const nivelUno = new Nivel(
    formaciones = [
        new Disposicion(filas = [
            fila.de(pulpo, 3),
            fila.separada(calamar, 3),
            fila.de(alien, 3)
        ])
    ]
)

// Nivel de demostración: una sola fila con un enemigo de cada tipo
const nivelDemo = new Nivel(
    formaciones = [
        new Disposicion(filas = [
            fila.mezcla([pulpo, calamar, alien, sepia, abeja, kamikaze, mosca, medusa, calamarAmarillo, alienAzul, pulpoRojo, calamarHeavy, alienHeavy, pulpoHeavy])
        ])
    ]
)