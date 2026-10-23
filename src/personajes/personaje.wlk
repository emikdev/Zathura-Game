import src.mecanicas.estados.disparando.*
import src.mecanicas.estados.impactado.*
class Personaje{

    var property position
    var property vidas
    var estadoActual

    const animacionBase
    const animacionDisparo
    const animacionImpacto

    const bando
    const property armasPersonaje = []

    method animacionBase(){
        return animacionBase
    }

    method bando(){
        return bando
    }

    method image(){
        return estadoActual.imgenActual() 
    }

    method cambiarEstado(nuevoEstado){
        estadoActual = nuevoEstado
    }

    method mover(direccion){
        estadoActual.mover(self, direccion)
    }

    method disparar(){
        self.cambiarEstado(new Disparando(animacion = animacionDisparo))
        estadoActual.disparar()
    }

    method recibirDano(){
        self.cambiarEstado(new Impactado(animacion = animacionImpacto))
    }

    method perderVida(){

        vidas -= 1

    }

    method iniciar()

}