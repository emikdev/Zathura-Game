import src.personajes.personaje.*
import src.mecanicas.formacion.*

class Enemigo inherits Personaje {
  
    const comportamientoAtaque
    const formacion

    override method iniciar() {
        game.onTick(500, "ataque" + self.identity(), { comportamientoAtaque.intentarAtacar(self) })
    }

    method intentarAtacar() {
        comportamientoAtaque.actuar(self)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
        game.removeTickEvent("ataque" + self.identity())
    }

}