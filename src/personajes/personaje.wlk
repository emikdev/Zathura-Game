import src.personajes.efectos.efectosPersonaje.*
import src.personajes.estados.neutral.*
class Personaje{

    var property position
    const posicionInicial

    var salud
    var vidas

    const tipoPersonaje
    const bando
    const arsenal = []

    var estadoActual
    var efectoVisual

    method arsenal(){
        return arsenal
    }

    method initialize(){
        estadoActual = new Neutral(personaje = self)
        efectoVisual = sinEfecto
        salud = tipoPersonaje.saludMaxima()
        vidas = tipoPersonaje.vidas()
        position = posicionInicial
        arsenal.agregarArmasIniciales(tipoPersonaje.arsenalInicial())
    }

    method animacionBase(){
        return tipoPersonaje.animacionBase()
    }

    method animacionDisparo(){
      return tipoPersonaje.animacionDisparo()
    }

    method animacionMuerte(){
      return tipoPersonaje.animacionMuerte()
    }

    method animacionImpacto(){
        return tipoPersonaje.animacionImpacto()
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
        salud = tipoPersonaje.saludMaxima()
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