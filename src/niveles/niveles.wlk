import src.niveles.oleada.*
import src.niveles.nivel.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*

const nivelDemo = new Nivel(oleadas = [
    new Oleada(
        intervalo = 800,
        disposicion =
            disposiciones.filaCentrada( pulpo, disposiciones.alturaDesdeArriba(2) , 1, 1) +
            disposiciones.filaCentrada(calamar, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(alien, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(sepia, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(abeja, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(kamikaze, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(mosca, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(medusa , disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(calamarAmarillo, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(alienAzul, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(pulpoRojo, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(calamarHeavy, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(alienHeavy, disposiciones.alturaDesdeArriba(2), 1, 1)+
            disposiciones.filaCentrada(pulpoHeavy, disposiciones.alturaDesdeArriba(2), 1, 1)


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