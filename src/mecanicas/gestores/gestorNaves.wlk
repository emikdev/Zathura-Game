import gestorNiveles.*
import src.mecanicas.controles.*
import src.menu.configuracion.*
import wollok.game.*
import src.personajes.factory.factory.*

object gestorNaves {

    var naves = []
    const controles = [controlesNave1, controlesNave2]

    method iniciar() {
        naves = configuracion.naves()   // se crean acá, con lo elegido en el menú

        naves.size().times({ n =>
            const i = n - 1
            const control = controles.get(i)
            const nave = naves.get(i)

            control.asignarA(nave)
            nave.iniciar()
        })
    }

    method eliminarNaveSinVidas(naveEliminada) {
        naves.remove(naveEliminada)

        if (naves.isEmpty()) {
            gestorNiveles.gameOver()
        }
    }
}