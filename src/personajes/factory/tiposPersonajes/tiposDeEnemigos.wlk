import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tipoPersonaje.*

import src.mecanicas.animaciones.recursos.recursoEnemigos.*

import src.personajes.comportamiento.ataque.ataques.*
import src.personajes.comportamiento.ataque.ningunaAccion.*

import src.mecanicas.armas.armasEnemigas.*
import src.mecanicas.arsenal.*
import src.gestores.gestorBufos.* // o src.buf.gestorBufos.* según el nombre exacto de tu carpeta


class TipoPersonajeEnemigo inherits TipoPersonaje {
    const comportamientoAtaque
    const property probabilidadBufo = 10 
    const puntosQueOtorga

    method comportamientoAtaque() = comportamientoAtaque
    method puntosQueOtorga() = puntosQueOtorga * configuracion.dificultad()

    method soltarBufoAlMorir(posicion) {
        gestorBufos.intentarSoltarBufoEn(posicion, probabilidadBufo)
    }
}

/* Normales (10% por defecto) */
const alien = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasica]),
    animacionBase = animacionBaseAlien,
    animacionDisparo = animacionDisparoAlien,
    animacionImpacto = animacionImpactoAlien,
    animacionMuerte = animacionMuerteAlien,
    comportamientoAtaque = ataques.probabilistico(10),
    puntosQueOtorga = 25
)

const calamar = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasica]),
    animacionBase = animacionBaseCalamar,
    animacionDisparo = animacionDisparoCalamar,
    animacionImpacto = animacionImpactoCalamar,
    animacionMuerte = animacionMuerteCalamar,
    comportamientoAtaque = ataques.probabilistico(10),
    puntosQueOtorga = 25
)

const pulpo = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasica]),
    animacionBase = animacionBasePulpo,
    animacionDisparo = animacionDisparoPulpo,
    animacionImpacto = animacionImpactoPulpo,
    animacionMuerte = animacionMuertePulpo,
    comportamientoAtaque = ataques.probabilistico(10),
    puntosQueOtorga = 25
)

/* Especiales (25%) */
const kamikaze = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = []),
    animacionBase = animacionBaseKamikaze,
    animacionDisparo = animacionDisparoKamikaze,
    animacionImpacto = animacionImpactoKamikaze,
    animacionMuerte = animacionMuerteKamikaze,
    comportamientoAtaque = ataques.soloInmolacion(40),
    puntosQueOtorga = 50,
    probabilidadBufo = 25
)

const mosca = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasica, armaPesadaEnemiga]),
    animacionBase = animacionBaseMosca,
    animacionDisparo = animacionDisparoMosca,
    animacionImpacto = animacionImpactoMosca,
    animacionMuerte = animacionMuerteMosca,
    comportamientoAtaque = ataques.conCarga(60, 50, 0, 1),
    puntosQueOtorga = 50,
    probabilidadBufo = 25
)

const abeja = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasicaAmarilla]),
    animacionBase = animacionBaseAbeja,
    animacionDisparo = animacionDisparoAbeja,
    animacionImpacto = animacionImpactoAbeja,
    animacionMuerte = animacionMuerteAbeja,
    comportamientoAtaque = ataques.conInmolacion(10, 20),
    puntosQueOtorga = 50,
    probabilidadBufo = 25
)

const medusa = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasicaMorada]),
    animacionBase = animacionBaseMedusa,
    animacionDisparo = animacionDisparoMedusa,
    animacionImpacto = animacionImpactoMedusa,
    animacionMuerte = animacionMuerteMedusa,
    comportamientoAtaque = ataques.probabilistico(40),
    puntosQueOtorga = 50,
    probabilidadBufo = 25
)

const sepia = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaRapidaEnemiga]),
    animacionBase = animacionBaseSepia,
    animacionDisparo = animacionDisparoSepia,
    animacionImpacto = animacionImpactoSepia,
    animacionMuerte = animacionMuerteSepia,
    comportamientoAtaque = ataques.probabilistico(40),
    puntosQueOtorga = 50,
    probabilidadBufo = 25
)

/* Especiales Retro (30%) */
const calamarAmarillo = new TipoPersonajeEnemigo(
    saludMaxima = 2,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasicaAmarilla]),
    animacionBase = animacionBaseCalamarAmarillo,
    animacionDisparo = animacionDisparoCalamarAmarillo,
    animacionImpacto = animacionImpactoCalamarAmarillo,
    animacionMuerte = animacionMuerteCalamarAmarillo,
    comportamientoAtaque = ataques.probabilistico(30),
    puntosQueOtorga = 50,
    probabilidadBufo = 30
)

const alienAzul = new TipoPersonajeEnemigo(
    saludMaxima = 2,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasicaAzul]),
    animacionBase = animacionBaseAlienAzul,
    animacionDisparo = animacionDisparoAlienAzul,
    animacionImpacto = animacionImpactoAlienAzul,
    animacionMuerte = animacionMuerteAlienAzul,
    comportamientoAtaque = ataques.probabilistico(20),
    puntosQueOtorga = 50,
    probabilidadBufo = 30
)

const pulpoRojo = new TipoPersonajeEnemigo(
    saludMaxima = 2,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasicaRoja]),
    animacionBase = animacionBasePulpoRojo,
    animacionDisparo = animacionDisparoPulpoRojo,
    animacionImpacto = animacionImpactoPulpoRojo,
    animacionMuerte = animacionMuertePulpoRojo,
    comportamientoAtaque = ataques.probabilistico(20),
    puntosQueOtorga = 50,
    probabilidadBufo = 30
)

/* Heavys (50%) */
const alienHeavy = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasica, armaEnemigaBasica]),
    animacionBase = animacionBaseAlienHeavy,
    animacionDisparo = animacionDisparoAlienHeavy,
    animacionImpacto = animacionImpactoAlienHeavy,
    animacionMuerte = animacionMuerteAlienHeavy,
    comportamientoAtaque = ataques.conCarga(15, 30, 0, 1),
    puntosQueOtorga = 100,
    probabilidadBufo = 50
)

const calamarHeavy = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasica, armaEnemigaBasica]),
    animacionBase = animacionBaseCalamarHeavy,
    animacionDisparo = animacionDisparoCalamarHeavy,
    animacionImpacto = animacionImpactoCalamarHeavy,
    animacionMuerte = animacionMuerteCalamarHeavy,
    comportamientoAtaque = ataques.conCarga(15, 30, 0, 1),
    puntosQueOtorga = 100,
    probabilidadBufo = 50
)

const pulpoHeavy = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = new Arsenal(armas = [armaEnemigaBasica, armaEnemigaBasica]),
    animacionBase = animacionBasePulpoHeavy,
    animacionDisparo = animacionDisparoPulpoHeavy,
    animacionImpacto = animacionImpactoPulpoHeavy,
    animacionMuerte = animacionMuertePulpoHeavy,
    comportamientoAtaque = ataques.conCarga(15, 30, 0, 1),
    puntosQueOtorga = 100,
    probabilidadBufo = 50
)

/* Cangrejos (100%) */
const cangrejoAmarillo = new TipoPersonajeEnemigo(
    saludMaxima = 10,
    vidas = 1,
    arsenalInicial = new Arsenal (armas = [armaDobleAmarilla]),
    animacionBase = animacionBaseCangrejoAmarillo,
    animacionDisparo = animacionDisparoCangrejoAmarillo,
    animacionImpacto = animacionImpactoCangrejoAmarillo,
    animacionMuerte = animacionMuerteCangrejoAmarillo,
    comportamientoAtaque = ataques.probabilistico(75),
    puntosQueOtorga = 500,
    probabilidadBufo = 100
)

const cangrejoAzul = new TipoPersonajeEnemigo(
    saludMaxima = 15,
    vidas = 1,
    arsenalInicial = new Arsenal (armas = [armaDobleAzul]),
    animacionBase = animacionBaseCangrejoAzul,
    animacionDisparo = animacionDisparoCangrejoAzul,
    animacionImpacto = animacionImpactoCangrejoAzul,
    animacionMuerte = animacionMuerteCangrejoAzul,
    comportamientoAtaque = ataques.probabilistico(80),
    puntosQueOtorga = 500,
    probabilidadBufo = 100
)

const cangrejoRojo = new TipoPersonajeEnemigo(
    saludMaxima = 20,
    vidas = 1,
    arsenalInicial = new Arsenal (armas = [armaDobleRoja]),
    animacionBase = animacionBaseCangrejoRojo,
    animacionDisparo = animacionDisparoCangrejoRojo,
    animacionImpacto = animacionImpactoCangrejoRojo,
    animacionMuerte = animacionMuerteCangrejoRojo,
    comportamientoAtaque = ataques.probabilistico(80),
    puntosQueOtorga = 500,
    probabilidadBufo = 100
)
