import src.niveles.nivel.*
import src.niveles.disposicion.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*
import src.menu.configuracion.*

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

object intervalo {
  
    var property intervalo = 800 

    method intervaloConDificultad() {
        return self.intervalo().div(configuracion.dificultad())
    } 
}

const nivelUno = new Nivel(
    formaciones = [
        new Disposicion(intervalo = intervalo.intervaloConDificultad() , filas = [
            fila.de(pulpo, 3),
            fila.separada(calamar, 3),
            fila.de(alien, 3)
        ]),

        new Disposicion(intervalo = intervalo.intervaloConDificultad() ,filas=[

            fila.separada(alien, 3),
            fila.de(calamar, 3),
            fila.separada(pulpo,3)
        ]),

        new Disposicion(intervalo = intervalo.intervaloConDificultad() , filas=[

            fila.de(cangrejoAmarillo, 1)

        ])
    ]
)

const nivelDos = new Nivel (

    formaciones =[

        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas=[
            fila.de(alien,3),
            fila.separada(alienHeavy, 2),
            fila.de(alien,3)

        ]),

        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas =[
            fila.de(calamar,3),
            fila.separada(calamarHeavy, 2),
            fila.de(calamar,3)

        ]),

        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas=[
            fila.de(pulpo,3),
            fila.separada(pulpoHeavy, 2),
            fila.de(pulpo,3)
        ]),

        new Disposicion (intervalo = intervalo.intervaloConDificultad() , filas=[

            fila.separada(cangrejoAzul, 1)
        ])
    ]
)

const nivelTres = new Nivel (

    formaciones =[
        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas= [
            fila.de(abeja, 3),
            fila.separada(mosca, 3),
            fila.separada(kamikaze, 3)
        ]),

        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas=[

            fila.de(medusa,3),
            fila.separada(sepia, 3),
            fila.separada(kamikaze,3)
        ]),

        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas=[

            fila.de(cangrejoAzul, 1)
        ])
    ]

)

const nivelCuatro = new Nivel(

    formaciones = [
        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas =[

            fila.de(alien,3),
            fila.separada(alienAzul, 2),
            fila.de(alien, 3)
        ]),

        new Disposicion (intervalo = intervalo.intervaloConDificultad(), filas=[

            fila.de(calamar,3),
            fila.separada(calamarAmarillo,2),
            fila.de(calamar,3)
        ]),

        new Disposicion (intervalo = intervalo.intervaloConDificultad() ,filas=[
            fila.de(pulpo,3),
            fila.separada(pulpoRojo,2),
            fila.de (pulpo, 3)
        ])
    ]
)

/*
    nivel 1 con los normales 2 o 3 oleadas y cangrejo amarillo
    nivel 2 normales con heavys y cangrejo azul
    nivel 3 normales con especiales y cangrejo rojo
    nivel 4 normales con retro .
*/