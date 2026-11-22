import wollok.game.*
import src.personajes.factory.factory.*

object gestorMuros {
    var muros = []
    const posiciones = [game.at(2, 3), game.at(7, 3), game.at(12, 3), game.at(17, 3)]

    method iniciar(dificultad) {
        self.detener()
        muros = posiciones.map({ p => factory.crearMuro(dificultad, p) })
        muros.forEach({ m => m.iniciar() })
    }

    method muroDestruido(muro) {
        muros.remove(muro)
        muro.retirar()
    }

    method detener() {
        muros.forEach({ m => m.retirar() })
        muros.clear()
    }

    method cantidadActivos() = muros.size()

    method hayMuroEn(posicion, disparo) {
        const murosChocados = muros.filter({ m => m.position() == posicion && m.estaEnPie() })
        
        if (not murosChocados.isEmpty()) {
            murosChocados.first().colisionaCon(disparo)
        }
    }

    method chocaKamikazeEn(posicion, kamikaze) {
        const murosChocados = muros.filter({ m => m.position() == posicion && m.estaEnPie() })
        if (not murosChocados.isEmpty()) {
            murosChocados.first().colisionaConObjeto(kamikaze)
        }
    }

}