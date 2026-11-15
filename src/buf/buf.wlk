import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.gestores.gestorNaves.*
import src.mecanicas.gestores.gestorBufos.*

class BufoArma {
    var property position
    const recursoAnimacion
    const fabricaArma 

    const velocidadCaida = 350
    const nombreEventoCaida = "caidaBufo_" + self.identity().toString()

    // Wollok Game llama a este método para dibujar el objeto en pantalla
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

    method aplicarA(nave) {
        const nuevaArma = fabricaArma.apply()
        nave.arsenal().agregarAlArma(nuevaArma)
        self.desaparecer()
    }

    method desaparecer() {
        game.removeTickEvent(nombreEventoCaida)
        if (game.hasVisual(self)) {
            game.removeVisual(self)
        }
        gestorBufos.quitar(self)
    }
}
