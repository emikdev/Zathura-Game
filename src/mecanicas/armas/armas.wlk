import src.sonidos.sonido.*
import src.mecanicas.disparo.*

class Arma {

    const recursoBala // recurso con frames y duracion de la bala
    const danoBala // daño base de la bala
    var property municion
    method municionConsumida() = 1 // cantidad de municion que gasta cada disparo

    method danoDisparo() {
        return danoBala
    }

    method disparar(personaje) {
        if (personaje.bando().puedeDisparar()) {
            self.generarProyectilEn(personaje.position(), personaje)
            self.consumirMunicion()
        }
    }

    // Instancia y registra UNA bala en la posición dada
    method generarProyectilEn(posicion, personaje) {
        const nuevoDisparo = new Disparo(
            recursoAnimacion = recursoBala,
            dano = self.danoDisparo(),
            bando = personaje.bando(),
            position = personaje.bando().ajustarPosicion(posicion) // Se ajusta la posicion en la que se crea la bala
        )

        nuevoDisparo.iniciar()
        personaje.bando().registrar(nuevoDisparo)
    }

    // Por defecto el arma base tiene munición mientras le quede alguna
    method hayMunicion() {
        return municion > 0
    }

    method consumirMunicion() {
        municion -= self.municionConsumida()
    }

}