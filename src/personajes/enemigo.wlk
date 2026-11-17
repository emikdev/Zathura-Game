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

    method seleccionarArma(slot){
        estadoActual.seleccionarArma(slot)
    }

    override method alQuedarseSinVidas() {
        formacion.quitar(self)
        gestorPuntaje.sumar(tipoPersonaje.puntosQueOtorga())
    }

    // Mensajes para la inmolacion

    var inmolandose = false

    method dejarFormacion(){
        formacion.quitar(self)
    }

    method verificarColisiones() {
        game.onCollideDo(self, { objetivo => objetivo.colisionaConObjeto(self) })
    }

    method inmolarse(){
        inmolandose = true
        self.verificarColisiones()
        game.schedule(formacion.intervalo() / 2, { self.avanzar() })
    }

    method avanzar(){
        if(inmolandose && abajo.puedeAvanzar((self.position()))){
            self.mover(abajo)
            game.schedule(formacion.intervalo() /2 , {self.avanzar()})
        }else{
            inmolandose = false
            self.morir()
        }
    }



}
