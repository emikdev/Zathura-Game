import src.mecanicas.disparo.*
import src.mecanicas.direcciones.*
import src.mecanicas.armas.clasesDeArmas.armasLaser.*

// Armas que disparan varios proyectiles a la vez
class ArmasConMasProyectiles inherits ArmaLaser {
    // Genera una bala en la columna vecina SOLO si esa celda existe en el tablero
    method generarProyectilLateral(direccion, personaje) {
        if (direccion.puedeAvanzar(personaje.position())) {
            self.generarProyectilEn(direccion.siguiente(personaje.position()), personaje)
        }
    }
}

class DobleCanon inherits ArmasConMasProyectiles {

    override method municionConsumida() = 2

    override method disparar(personaje) {
        if (personaje.bando().puedeDisparar()) {
            self.generarProyectilLateral(izquierda, personaje)
            self.generarProyectilLateral(derecha, personaje)
            self.consumirMunicion()
        }
    }

}

class TripleCanon inherits ArmasConMasProyectiles {

    override method municionConsumida() = 3

    override method disparar(personaje) {
        if (personaje.bando().puedeDisparar()) {
            self.generarProyectilEn(personaje.position(), personaje)   // centro: siempre existe
            self.generarProyectilLateral(derecha, personaje)
            self.generarProyectilLateral(izquierda, personaje)
            self.consumirMunicion()
        }
    }

}