import src.personajes.efectos.efectosPersonaje.*
import src.personajes.estados.neutral.*
class Personaje{

    var property position
    var estadoActual

    const posicionInicial
    const saludMaxima
    var salud
    var vidas

    const animacionBase
    const animacionDisparo
    const animacionMuerte

    const animacionImpacto
    var efectoVisual

    const bando

    const arsenal

    method arsenal(){
        return arsenal
    }

    method initialize(){
        estadoActual = new Neutral(personaje = self)
        efectoVisual = sinEfecto
        salud = saludMaxima
        position = posicionInicial
    }

    method animacionBase(){
        return animacionBase
    }

    method animacionDisparo(){
        return animacionDisparo
    }

    method aniamcionMuerte(){
        return animacionMuerte
    }

    method animacionImpacto(){
        return animacionImpacto
    }

    method bando(){
        return bando
    }

    method posicionInicial(){
        return posicionInicial
    }

    method image(){
        return efectoVisual.imagen(estadoActual.imagenActual())
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

    method restarSalud(dano){ 
        salud = (salud - dano).max(0) 
    }

    method sinSalud(){
        return salud <= 0
    }

    method restaurarSalud(){ 
        salud = saludMaxima
    }

    method perderVida(){
        vidas -= 1
    }

    method tieneVidas(){
        return  vidas > 0
    }

    method recibirDano(dano){
        estadoActual.recibirImpacto(dano)
    }

    method cambiarEfecto(nuevoEfecto) {
        efectoVisual.detener()   // Corta el efecto anterior
        efectoVisual = nuevoEfecto
    }

    method iniciar(){ }
    method alQuedarseSinVidas(){ }

}