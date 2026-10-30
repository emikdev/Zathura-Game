import src.mecanicas.direcciones.*
import game.*

class Controles {
    const teclaIzquierda
    const teclaDerecha
    const teclaDisparo
    const teclaSiguienteArma

    method asignarA(nave) {
        teclaIzquierda.onPressDo({ nave.estadoActual().mover(izquierda) })
        teclaDerecha.onPressDo({ nave.estadoActual().mover(derecha) })
        teclaDisparo.onPressDo({ nave.estadoActual().disparar() })
        teclaSiguienteArma.onPressDo({ nave.estadoActual().siguienteArma() })
    }
}