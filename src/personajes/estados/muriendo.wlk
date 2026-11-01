import wollok.game.*
import src.personajes.estados.estadoPersonaje.*
import src.personajes.estados.neutral.*

class Muriendo inherits EstadoPersonaje {

    override method initialize() {
        super()
        personaje.perderVida()
    }

    override method recursoAnimacion(){
        return personaje.animacionMuerte()
    }

    override method terminoAnimacion() {
        game.removeVisual(personaje)
        if (personaje.tieneVidas()) {
            game.schedule(3000, { self.reaparecer() })
        } else {
            personaje.alQuedarseSinVidas()
        }
    }

    method reaparecer() {
        personaje.restaurarSalud()
        personaje.position(personaje.posicionInicial())
        game.addVisual(personaje)
        self.cambiarANeutral()
    }

    // Mientras muere: ignora daño, movimiento, disparo y cambio de arma
    override method mover(direccion) { }
    override method disparar() { }
    override method recibirImpacto(dano) { }
    override method siguienteArma() { }
    override method seleccionarArma(slot) { }
}