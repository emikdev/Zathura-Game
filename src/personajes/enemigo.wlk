import src.personajes.personaje.*
import src.mecanicas.formacion.*

class Enemigo inherits Personaje {
  
    const formacion

    method intentarAtacar() {
        tipoPersonaje.comportamientoAtaque().actuar(self)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
    }

}