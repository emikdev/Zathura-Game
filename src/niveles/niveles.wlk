import src.niveles.oleada.*
import src.niveles.nivel.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*

const nivelUno = new Nivel(oleadas = [
    new Oleada(
        intervalo = 800,
        disposicion =
            disposiciones.filaCentrada(pulpo,   disposiciones.alturaDesdeArriba(1), 4, 2) +
            disposiciones.filaCentrada(calamar, disposiciones.alturaDesdeArriba(2), 4, 2) +
            disposiciones.filaCentrada(alien,   disposiciones.alturaDesdeArriba(3), 4, 2)
    )
])