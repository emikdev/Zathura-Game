import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.personajes.personaje.*
import src.niveles.formacion.*
import src.mecanicas.gestores.gestorBufos.* 
import src.mecanicas.gestores.gestorDePuntos.*

class Enemigo inherits Personaje {
  
    const formacion

    method intentarAtacar() {
        tipoPersonaje.comportamientoAtaque().actuar(self)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
        gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
        // Intentamos soltar un bufo con la probabilidad definida en el tipo de enemigo
        tipoPersonaje.soltarBufoAlMorir(position)   
    }

    override method colisionaConMuro(muro) {
        muro.destruirse()
        self.morir()
    }

}