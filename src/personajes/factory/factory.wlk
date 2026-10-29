import wollok.game.*
import src.mecanicas.bandos.*
import src.personajes.enemigo.*
import src.personajes.nave.*
import src.personajes.efectos.efectosPersonaje.*

// Factory encargada de crear y configurar enemigos
object factory {

    method crearEnemigo(tipo, formacion, posicion) = new Enemigo(
        formacion = formacion,
        posicionInicial = posicion,
        saludMaxima = tipo.hp(),
        vidas = tipo.vidas(),
        animacionBase = tipo.framesBase(),
        animacionDisparo = tipo.framesDisparo(),
        animacionMuerte = tipo.framesMuerte(),
        animacionImpacto = tipo.framesImpacto(),
        bando = bandoEnemigo,
        arsenal = tipo.arsenal(),
        comportamientoAtaque = tipo.comportamientoAtaque()
    )

    method crearNave(tipo, posicion) = new NaveJugador(
        posicionInicial = posicion,
        saludMaxima = tipo.hp(),
        vidas = tipo.vidas(),
        animacionBase = tipo.framesBase(),
        animacionDisparo = tipo.framesDisparo(),
        animacionMuerte = tipo.framesMuerte(),
        animacionImpacto = tipo.framesImpacto(),
        bando = bandoJugador,
        arsenal = tipo.arsenal()
    )
}