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

    method animacionDisparo(){
        return animacionDisparo
    }

    method aniamcionImpacto(){
        return animacionImpacto
    }

    method bando(){
        return bando
    }

    method image(){
        return estadoActual.imgenActual() 
    }

    method cambiarEstado(nuevoEstado) {
        estadoActual.finalizarAnimacion()
        estadoActual = nuevoEstado
    }

    method mover(direccion){
        estadoActual.mover(direccion)
    }

    method disparar(){
        estadoActual.disparar()
    }

    method recibirImpacto(){
        estadoActual.recibirImpacto()
    }

    method perderVida(){
        vidas -= 1
    }

    method iniciar()

}