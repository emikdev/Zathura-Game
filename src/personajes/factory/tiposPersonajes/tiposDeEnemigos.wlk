import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.mecanicas.animaciones.recursos.recursoEnemigos.*
import src.personajes.factory.comportamiento.ataque.ataques.*
import src.personajes.factory.comportamiento.ataque.ningunaAccion.*

// Un enemigo es un personaje que además sabe cómo ataca.
class TipoPersonajeEnemigo inherits TipoPersonaje {

    const comportamientoAtaque

    method comportamientoAtaque() {
        return comportamientoAtaque
    }

}

    /* MUY IMPORTANTE: Convención de los slots del arsenal: 0 = arma normal, 1 = arma pesada */

/*  */

const abeja = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica
    animacionBase = animacionBaseAbeja,
    animacionDisparo = animacionDisparoAbeja,
    animacionImpacto = animacionImpactoAbeja,
    animacionMuerte = animacionMuerteAbeja,
    comportamientoAtaque = ataques.conInmolacion(10, 20)
)

const alien = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica
    animacionBase = animacionBaseAlien,
    animacionDisparo = animacionDisparoAlien,
    animacionImpacto = animacionImpactoAlien,
    animacionMuerte = animacionMuerteAlien,
    comportamientoAtaque = ataques.probabilistico(20)
)

const calamar = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica
    animacionBase = animacionBaseCalamar,
    animacionDisparo = animacionDisparoCalamar,
    animacionImpacto = animacionImpactoCalamar,
    animacionMuerte = animacionMuerteCalamar,
    comportamientoAtaque = ataques.probabilistico(20)
)

const medusa = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Rapida
    animacionBase = animacionBaseMedusa,
    animacionDisparo = animacionDisparoMedusa,
    animacionImpacto = animacionImpactoMedusa,
    animacionMuerte = animacionMuerteMedusa,
    comportamientoAtaque = ataques.probabilistico(20)
)

const mosca = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica y arma Especial
    animacionBase = animacionBaseMosca,
    animacionDisparo = animacionDisparoMosca,
    animacionImpacto = animacionImpactoMosca,
    animacionMuerte = animacionMuerteMosca,
    comportamientoAtaque = ataques.conCarga(60, 50, 0, 1)
)

const pulpo = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica
    animacionBase = animacionBasePulpo,
    animacionDisparo = animacionDisparoPulpo,
    animacionImpacto = animacionImpactoPulpo,
    animacionMuerte = animacionMuertePulpo,
    comportamientoAtaque = ataques.probabilistico(40)
)

const sepia = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Rapida
    animacionBase = animacionBaseSepia,
    animacionDisparo = animacionDisparoSepia,
    animacionImpacto = animacionImpactoSepia,
    animacionMuerte = animacionMuerteSepia,
    comportamientoAtaque = ataques.probabilistico(40)
)

const calamarAmarillo = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica
    animacionBase = animacionBaseCalamarAmarillo,
    animacionDisparo = animacionDisparoCalamarAmarillo,
    animacionImpacto = animacionImpactoCalamarAmarillo,
    animacionMuerte = animacionMuerteCalamarAmarillo,
    comportamientoAtaque = ataques.probabilistico(30)
)

const cangrejoAmarillo = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma disparo triple
    animacionBase = animacionBaseCangrejoAmarillo,
    animacionDisparo = animacionDisparoCangrejoAmarillo,
    animacionImpacto = animacionImpactoCangrejoAmarillo,
    animacionMuerte = animacionMuerteCangrejoAmarillo,
    comportamientoAtaque = ataques.probabilistico(100)
)

const alienAzul = new TipoPersonajeEnemigo(
    saludMaxima = 2,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica
    animacionBase = animacionBaseAlienAzul,
    animacionDisparo = animacionDisparoAlienAzul,
    animacionImpacto = animacionImpactoAlienAzul,
    animacionMuerte = animacionMuerteAlienAzul,
    comportamientoAtaque = ataques.probabilistico(20)
)

const cangrejoAzul = new TipoPersonajeEnemigo(
    saludMaxima = 2,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma disparo triple
    animacionBase = animacionBaseCangrejoAzul,
    animacionDisparo = animacionDisparoCangrejoAzul,
    animacionImpacto = animacionImpactoCangrejoAzul,
    animacionMuerte = animacionMuerteCangrejoAzul,
    comportamientoAtaque = ataques.probabilistico(100)
)

const cangrejoRojo = new TipoPersonajeEnemigo(
    saludMaxima = 2,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma disparo triple
    animacionBase = animacionBaseCangrejoRojo,
    animacionDisparo = animacionDisparoCangrejoRojo,
    animacionImpacto = animacionImpactoCangrejoRojo,
    animacionMuerte = animacionMuerteCangrejoRojo,
    comportamientoAtaque = ataques.probabilistico(100)
)

const pulpoRojo = new TipoPersonajeEnemigo(
    saludMaxima = 2,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica
    animacionBase = animacionBasePulpoRojo,
    animacionDisparo = animacionDisparoPulpoRojo,
    animacionImpacto = animacionImpactoPulpoRojo,
    animacionMuerte = animacionMuertePulpoRojo,
    comportamientoAtaque = ataques.probabilistico(20)
)

const alienHeavy = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica y pesada
    animacionBase = animacionBaseAlienHeavy,
    animacionDisparo = animacionDisparoAlienHeavy,
    animacionImpacto = animacionImpactoAlienHeavy,
    animacionMuerte = animacionMuerteAlienHeavy,
    comportamientoAtaque = ataques.conCarga(15, 30, 0, 1)
)

const calamarHeavy = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica y pesada
    animacionBase = animacionBaseCalamarHeavy,
    animacionDisparo = animacionDisparoCalamarHeavy,
    animacionImpacto = animacionImpactoCalamarHeavy,
    animacionMuerte = animacionMuerteCalamarHeavy,
    comportamientoAtaque = ataques.conCarga(15, 30, 0, 1)
)

const pulpoHeavy = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = [], // FALTA: Arma Basica y pesada
    animacionBase = animacionBasePulpoHeavy,
    animacionDisparo = animacionDisparoPulpoHeavy,
    animacionImpacto = animacionImpactoPulpoHeavy,
    animacionMuerte = animacionMuertePulpoHeavy,
    comportamientoAtaque = ataques.conCarga(15, 30, 0, 1)
)

// ---------- Especiales ----------

const kamikaze = new TipoPersonajeEnemigo(
    saludMaxima = 3,
    vidas = 1,
    arsenalInicial = [], // No dispara; solo se inmola
    animacionBase = animacionBaseKamikaze,
    animacionDisparo = animacionDisparoKamikaze, // No dispara, pero Personaje la pide
    animacionImpacto = animacionImpactoKamikaze,
    animacionMuerte = animacionMuerteKamikaze,
    comportamientoAtaque = ataques.soloInmolacion(40)
)

// FALTA: definir cómo se comporta el ovni. No ataca y casi seguro no pertenece a una formación.
const ovni = new TipoPersonajeEnemigo(
    saludMaxima = 1,
    vidas = 1,
    arsenalInicial = [], // No dispara
    animacionBase = animacionBaseOvniClasico,
    animacionDisparo = animacionDisparoOvniClasico,
    animacionImpacto = animacionImpactoOvniClasico,
    animacionMuerte = animacionMuerteOvniClasico,
    comportamientoAtaque = ningunaAccion
)