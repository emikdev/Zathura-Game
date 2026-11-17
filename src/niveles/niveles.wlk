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
        ]),

        new Disposicion(filas=[

            fila.de(alien, 2),
            fila.separada(calamar, 3),
            fila.de(pulpo,2)
        ]),

        new Disposicion(intervalo = 600 , filas=[

            fila.separada(cangrejoAmarillo, 1)

        ])
    ]
)

const nivelDos = new Nivel (

    formaciones =[

        new Disposicion (filas=[
            fila.de(alien,3),
            fila.separada(alienHeavy, 1),
            fila.de(alien,3)

        ]),

        new Disposicion (filas =[
            fila.de(calamar,3),
            fila.separada(calamarHeavy, 1),
            fila.de(calamar,3)

        ]),

        new Disposicion (filas=[
            fila.de(pulpo,3),
            fila.separada(pulpoHeavy, 1),
            fila.de(pulpo,3)
        ]),

        new Disposicion (intervalo = 500 , filas=[

            fila.separada(cangrejoAzul, 1)
        ])
    ]
)

/*
    nivel 1 con los normales 2 o 3 oleadas y cangrejo amarillo
    nivel 2 normales con heavys y cangrejo azul
    nivel 3 normales con especiales y cangrejo rojo
    nivel 4 normales con retro .
*/