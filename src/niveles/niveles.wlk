import src.niveles.oleada.*
import src.niveles.nivel.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*

const nivelUno = new Nivel(oleadas = [
    new Oleada(
        intervalo = 800,
        disposicion =
            disposiciones.filaCentrada(pulpo,   disposiciones.alturaDesdeArriba(1), 3, 1) +
            disposiciones.filaCentrada(calamar, disposiciones.alturaDesdeArriba(2), 3, 2) +
            disposiciones.filaCentrada(alien,   disposiciones.alturaDesdeArriba(3), 3, 1)
    )
])