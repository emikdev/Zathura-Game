import src.menu.efectos.*
import src.mecanicas.disparo.*

class Arma {

    const recursoBala // recurso con frames y duracion de la bala
    const danoBala = 10 // daño base de la bala
    var property municion

    method danoDisparo() { // daño de la bala (para que después las armas que consumen más munición hagan más daño)
        return danoBala
    }

    method disparar(personaje) {

        if (personaje.bando().puedeDisparar()) {

            const nuevoDisparo = new Disparo(
                recursoAnimacion = recursoBala,
                dano = self.danoDisparo(),
                bando = personaje.bando(),
                position = personaje.position()
            )

            nuevoDisparo.iniciar()
            efectos.reproducir("disparo.mp3")
            personaje.bando().registrar(nuevoDisparo)
            self.consumirMunicion()
        }

    }

    // POLIMORFISMO: Por defecto el arma base SIEMPRE tiene munición
    method hayMunicion() {
        return municion > 0
    }

    method consumirMunicion() {
        municion -= 1
    }

}