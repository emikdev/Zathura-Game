import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.mecanicas.animaciones.recursos.recursosNaves.*

import src.mecanicas.arsenal.*
import src.mecanicas.armas.armasNave.*
import src.mecanicas.armas.armasEnemigas.*

class TipoPersonajeNave inherits TipoPersonaje {
    // No necesita atributos extra, pero su existencia separa conceptualmente las naves de los enemigos
}

    /* MUY IMPORTANTE: Convención de los slots del arsenal: 0 = arma normal */

// Equilibrada, nada especial, solo la experiencia vanilla de space invaders
const naveNormal = new TipoPersonajeNave(
    saludMaxima = 3,
    vidas = 3,
    arsenalInicial = new Arsenal (armas = [armaBasica, dobleCanonPesado]), // FALTA: Arma Basica
    animacionBase = animacionBaseNaveBasica,
    animacionDisparo = animacionDisparoNaveBasica,
    animacionImpacto = animacionImpactoNaveBasica,
    animacionMuerte = animacionMuerteNaveBasica
)

// Aguanta más daño y tiene un arma pesada pero tiene una vida
const naveTanque = new TipoPersonajeNave(
    saludMaxima = 6,
    vidas = 2,
    arsenalInicial = new Arsenal (armas = [armaBasica]), // FALTA: Arma Basica y arma especial
    animacionBase = animacionBaseNaveTanque,
    animacionDisparo = animacionDisparoNaveTanque, 
    animacionImpacto = animacionImpactoNaveTanque,
    animacionMuerte = animacionMuerteNaveTanque
)

// Frágil, compensa con un pesada y un arma más rápida
const naveAtaque = new TipoPersonajeNave(
    saludMaxima = 1,
    vidas = 3,
    arsenalInicial = new Arsenal (armas = [armaBasica, tripleCanonPesado, armaRapidaEnemiga]), // FALTA: Arma Basica, arma pesada y arma rapida
    animacionBase = animacionBaseNaveAtaque,
    animacionDisparo = animacionDisparoNaveAtaque,
    animacionImpacto = animacionImpactoNaveAtaque,
    animacionMuerte = animacionMuerteNaveAtaque
)