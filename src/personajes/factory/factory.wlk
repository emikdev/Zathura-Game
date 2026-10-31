import wollok.game.*
import src.mecanicas.bandos.*
import src.personajes.enemigo.*
import src.personajes.nave.*
import src.personajes.efectos.efectosPersonaje.*

// Factory encargada de crear personajes a partir de su tipo
object factory {

    method crearEnemigo(tipoPersonaje, formacion, posicion) = new Enemigo(
        tipoPersonaje = tipoPersonaje,
        bando = bandoEnemigo,
        formacion = formacion,
        posicionInicial = posicion
    )

    method crearNave(tipoPersonaje, posicion) = new NaveJugador(
        tipoPersonaje = tipoPersonaje,
        bando = bandoJugador,
        posicionInicial = posicion
    )
}