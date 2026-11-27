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
        
        var i = 0
        naves.forEach({ nave =>
            const control = controles.get(i)
            control.asignarA(nave)
            nave.iniciar()
            i += 1
        })
        
        hud.iniciar(naves)
    }

    // Método para el cambio de nivel
    method restaurarVisuales() {
        var i = 0
        naves.forEach({ nave =>
            const control = controles.get(i)
            control.asignarA(nave) 
            nave.restaurarParaNuevoNivel() 
            i += 1
        })
        
        hud.iniciar(naves) 
    }

    method eliminarNaveSinVidas(naveEliminada) {
        naves.remove(naveEliminada)
        if (naves.isEmpty()) {
            gestorNiveles.gameOver()
        }
    }

    // --- MÉTODOS DE COLISIÓN (LOS QUE FALTABAN) ---
    
    // Para los disparos enemigos
    method chocaDisparoEn(posicion, disparo) {
        const navesChocadas = naves.filter({ n => n.position() == posicion })
        if (not navesChocadas.isEmpty()) {
            navesChocadas.first().colisionaCon(disparo)
        }
    }

    // Para los kamikazes
    method chocaKamikazeEn(posicion, kamikaze) {
        const navesChocadas = naves.filter({ n => n.position() == posicion })
        if (not navesChocadas.isEmpty()) {
            navesChocadas.first().colisionaConObjeto(kamikaze)
        }
    }
}