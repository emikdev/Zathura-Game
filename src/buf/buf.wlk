import wollok.game.*
import src.mecanicas.direcciones.*
import src.gestores.gestorNaves.*
import src.gestores.gestorBufos.*

// Clase base abstracta: maneja la caída, colisión y ciclo de vida en pantalla
class Bufo {
    var property position
    const recursoAnimacion
    var activo = false

    const velocidadCaida = 350
    const nombreEventoCaida = "caidaBufo_" + self.identity().toString()

    method image() {
        return recursoAnimacion.frames().first()
    }

    method iniciar() {
        activo = true
        game.addVisual(self)
        gestorBufos.registrar(self)

        game.onTick(velocidadCaida, nombreEventoCaida, {
            self.caer()
        })

        game.onCollideDo(self, { otroObjeto =>
            if (activo and gestorNaves.esNaveJugador(otroObjeto)) {
                self.aplicarA(otroObjeto)
                self.desaparecer()
            }
        })
    }

    method caer() {
        if (activo) {
            if (abajo.puedeAvanzar(position)) {
                position = abajo.siguiente(position)
            } else {
                self.desaparecer()
            }
        }
    }

    // Método abstracto: cada bufo define su propio efecto
    method aplicarA(nave)

    method desaparecer() {
        if (activo) {
            activo = false
            game.removeTickEvent(nombreEventoCaida)
            if (game.hasVisual(self)) {
                game.removeVisual(self)
            }
            gestorBufos.quitar(self)
        }
    }
    
    method colisionaCon(objeto) {}
}

// Bufo que agrega un arma al arsenal
class BufoArma inherits Bufo {
    const fabricaArma

    override method aplicarA(nave) {
        const nuevaArma = fabricaArma.apply()
        nave.arsenal().agregarArma(nuevaArma)
    }
}

// Bufo que suma 1 vida a la nave que lo agarra
class BufoVida inherits Bufo {
    override method aplicarA(nave) {
        nave.ganarVida()
    }
}

// Bufo que activa el escudo del jugador por 10 segundos
class BufoEscudo inherits Bufo {
    override method aplicarA(nave) {
        gestorBufos.activarEscudoTemporal(10000)
    }
}

// Bufo que congela los disparos enemigos por 5 segundos
class BufoBloqueo inherits Bufo {
    override method aplicarA(nave) {
        gestorBufos.activarBloqueoTemporal(5000)
    }
}
