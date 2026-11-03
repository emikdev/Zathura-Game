import src.mecanicas.direcciones.*
import src.personajes.personaje.*

class Controles {
    const teclaIzquierda
    const teclaDerecha
    const teclaDisparo
    const teclaSiguienteArma

    method asignarA(nave) {
        teclaIzquierda.onPressDo({ nave.mover(izquierda) })
        teclaDerecha.onPressDo({ nave.mover(derecha) })
        teclaDisparo.onPressDo({ nave.disparar() })
        teclaSiguienteArma.onPressDo({ nave.siguienteArma() })
    }
}

const controlesNave1 = new Controles(
    teclaIzquierda = keyboard.a(),
    teclaDerecha = keyboard.d(),
    teclaDisparo = keyboard.space(),
    teclaSiguienteArma = keyboard.q()
)

const controlesNave2 = new Controles(
    teclaIzquierda = keyboard.left(),
    teclaDerecha = keyboard.right(),
    teclaDisparo = keyboard.up(),
    teclaSiguienteArma = keyboard.enter()
)