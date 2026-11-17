import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.personajes.personaje.*
import src.niveles.formacion.*
import src.mecanicas.direcciones.*
import src.mecanicas.gestores.gestorDePuntos.*


class Enemigo inherits Personaje {
  
    const formacion

    method intentarAtacar() {
        tipoPersonaje.comportamientoAtaque().actuar(self)
    }

    method dejarFormacion(){
        formacion.quitar(self)
    }

    method inmolarse(){
        if(abajo.puedeAvanzar((self.position()))){
            self.mover(abajo)
            self.inmolarse()
        }else{
            self.morir()
        }
    }

    method seleccionarArma(slot){
        estadoActual.seleccionarArma(slot)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
        gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
    }

    override method colisionaConMuro(muro) {
        muro.destruirse()
        self.morir()
    }

}