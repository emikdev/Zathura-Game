import src.personajes.factory.tiposPersonajes.tipoPersonaje.*
import src.personajes.personaje.*
import src.niveles.formacion.*
import src.mecanicas.direcciones.*
import src.mecanicas.gestores.gestorDePuntos.*
import src.mecanicas.gestores.gestorBufos.*

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

    override method seleccionarArma(slot){
        estadoActual.seleccionarArma(slot)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
        gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
        // Intentamos soltar un bufo con la probabilidad definida en el tipo de enemigo
        tipoPersonaje.soltarBufoAlMorir(position)   
    }

    // Mensajes para la inmolacion

    var inmolandose = false


    method verificarColisiones() {
        game.onCollideDo(self, { objetivo => objetivo.colisionarConObjeto(self) })
    }

    method avanzar(){
        if(inmolandose && abajo.puedeAvanzar((self.position()))){
            self.mover(abajo)
        }else{
            inmolandose = false
            self.morir()
        }
    }

}
