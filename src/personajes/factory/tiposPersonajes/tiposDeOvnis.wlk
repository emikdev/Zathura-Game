import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*
import src.personajes.comportamiento.ataque.ningunaAccion.*

import src.mecanicas.animaciones.recursos.recursoEnemigos.*
import src.personajes.comportamiento.ataque.ataques.*

import src.mecanicas.arsenal.*

// Un Ovni es un caso especial de enemigo: no ataca (ningunaAccion) pero da puntos.
class TipoPersonajeOvni inherits TipoPersonajeEnemigo {
    override method comportamientoAtaque() = ningunaAccion
}

const ovniBasico = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal (armas = []), // No dispara
    animacionBase = animacionBaseOvniClasico,
    animacionDisparo = animacionDisparoOvniClasico,
    animacionImpacto = animacionImpactoOvniClasico,
    animacionMuerte = animacionMuerteOvniClasico,
    comportamientoAtaque = ningunaAccion,
    puntosQueOtorga = 500,
    probabilidadBufo = 100 
)