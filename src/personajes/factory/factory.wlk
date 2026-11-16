import wollok.game.*
import src.mecanicas.bandos.*
import src.personajes.enemigo.*
import src.personajes.nave.*
import src.muros.muros.*

// Factory encargada de crear personajes a partir de su tipo
object factory {

    method crearEnemigo(tipoPersonaje, formacion, posicion) = new Enemigo(
        tipoPersonaje = tipoPersonaje,
        bando = enemigo,
        formacion = formacion,
        posicionInicial = posicion
    )

    method crearNave(tipoPersonaje, posicion) = new NaveJugador(
        tipoPersonaje = tipoPersonaje,
        bando = jugador,
        posicionInicial = posicion
    )

    method crearMuro(dificultad, position) = new Muro(
        impactosIniciales = (dificultad - 1).max(0),
        position = position
    )
        
}