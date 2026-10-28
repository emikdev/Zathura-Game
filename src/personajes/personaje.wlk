import src.mecanicas.efectos.efectosPersonaje.*
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

    const armasPersonaje
    var indiceArma = 0

    method initialize(){
        self.cambiarEfecto(sinEfecto)
        self.restaurarSalud()
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

    method armaActual(){
        return armasPersonaje.get(indiceArma)
    }

    method equiparSiguienteArma(){
        indiceArma = (indiceArma + 1) % armasPersonaje.size()
    }

    method equiparArma(slot){
        indiceArma = slot - 1
    }

    method descartarArma(arma) {
        armasPersonaje.remove(arma)
        indiceArma = 0
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