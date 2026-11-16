import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.personajes.personaje.*
import src.niveles.formacion.*
import src.mecanicas.gestores.gestorDePuntos.*


class Enemigo inherits Personaje {
  
    const formacion

    method intentarAtacar() {
        tipoPersonaje.comportamientoAtaque().actuar(self)
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