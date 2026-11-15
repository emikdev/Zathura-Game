import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.gestores.gestorNaves.*
import src.mecanicas.gestores.gestorBufos.*

// Clase base abstracta: maneja la caída, colisión y ciclo de vida en pantalla
class Bufo {
    var property position
    const recursoAnimacion

    const velocidadCaida = 350
    const nombreEventoCaida = "caidaBufo_" + self.identity().toString()

    method image() {
        return recursoAnimacion.frames().first()
    }

    method iniciar() {
        game.addVisual(self)
        gestorBufos.registrar(self)

        game.onTick(velocidadCaida, nombreEventoCaida, {
            self.caer()
        })

        game.onCollideDo(self, { otroObjeto =>
            if (gestorNaves.esNaveJugador(otroObjeto)) {
                self.aplicarA(otroObjeto)
                self.desaparecer()
            }
        })
    }

    method caer() {
        if (abajo.puedeAvanzar(position)) {
            position = abajo.siguiente(position)
        } else {
            self.desaparecer()
        }
    }

    // Método abstracto: cada bufo define su propio efecto
    method aplicarA(nave)

    method desaparecer() {
        game.removeTickEvent(nombreEventoCaida)
        if (game.hasVisual(self)) {
            game.removeVisual(self)
        }
        gestorBufos.quitar(self)
    }
    
    method colisionaCon(objeto) {} // metodo vacío para que no haga nada al colisionar con un objeto que no sea la nave
}

// Bufo que agrega un arma al arsenal
class BufoArma inherits Bufo {
    const fabricaArma

    override method aplicarA(nave) {
        const nuevaArma = fabricaArma.apply()
        nave.arsenal().agregarAlArma(nuevaArma)
    }
}

// Bufo que suma 1 vida a la nave que lo agarra
class BufoVida inherits Bufo {
    override method aplicarA(nave) {
        nave.ganarVida()
    }
}
