import src.personajes.personaje.*
import src.mecanicas.formacion.*

class Enemigo inherits Personaje {
  
    const comportamientoAtaque
    const formacion

    method intentarAtacar() {
        comportamientoAtaque.actuar(self)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
    }

}