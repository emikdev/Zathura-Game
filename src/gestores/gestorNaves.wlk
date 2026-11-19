import src.gestores.gestorNiveles.*
import src.mecanicas.controles.*
import src.menu.configuracion.*
import wollok.game.*
import src.personajes.factory.factory.*
import src.mecanicas.hud.hudJugador.*

object gestorNaves {
    var naves = []
    const controles = [controlesNave1, controlesNave2]

    method iniciar() {
        naves = configuracion.naves()
        naves.size().times({ n =>
            const i = n - 1
            const control = controles.get(i)
            const nave = naves.get(i)

            control.asignarA(nave)
            nave.iniciar()
        })
        hud.iniciar(naves)
    }

    method eliminarNaveSinVidas(naveEliminada) {
        naves.remove(naveEliminada)
        if (naves.isEmpty()) {
            gestorNiveles.gameOver()
        }
    }

    // NUEVO MÉTODO PARA COLISIONES
    
    // El disparo enemigo llama a este
    method chocaDisparoEn(posicion, disparo) {
        const navesChocadas = naves.filter({ n => n.position() == posicion })
        if (not navesChocadas.isEmpty()) {
            navesChocadas.first().colisionaCon(disparo)
        }
    }

    // El kamikaze llama a este
    method chocaKamikazeEn(posicion, kamikaze) {
        const navesChocadas = naves.filter({ n => n.position() == posicion })
        if (not navesChocadas.isEmpty()) {
            navesChocadas.first().colisionaConObjeto(kamikaze)
        }
    }

}