import src.personajes.personaje.*
import src.niveles.formacion.*
import src.mecanicas.gestores.gestorBufos.* 

class Enemigo inherits Personaje {
  
    const formacion

    method intentarAtacar() {
        tipoPersonaje.comportamientoAtaque().actuar(self)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
        // Intentamos soltar un bufo con la probabilidad definida en el tipo de enemigo
        gestorBufos.intentarSoltarBufoEn(position)
    }

    

}