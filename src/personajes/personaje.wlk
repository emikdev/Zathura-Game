import src.mecanicas.animaciones.animacion.*
import src.personajes.efectos.efectosPersonaje.*
import src.personajes.estados.neutral.*
import src.gestores.reloj.*

class Personaje {
  var property position
  const posicionInicial

  var salud
  var vidas

  const tipoPersonaje
  const bando
    
  var arsenal

  var estadoActual
  var efectoVisual

  method initialize() {
    estadoActual = new Neutral(personaje = self)
    efectoVisual = sinEfecto
    salud = tipoPersonaje.saludMaxima()
    vidas = tipoPersonaje.vidas()
    position = posicionInicial
    arsenal = tipoPersonaje.arsenalInicial()
  }

  method arsenal() = arsenal
  method animacionBase() = tipoPersonaje.animacionBase()
  method animacionDisparo() = tipoPersonaje.animacionDisparo()
  method animacionMuerte() = tipoPersonaje.animacionMuerte()
  method animacionImpacto() = tipoPersonaje.animacionImpacto()
  method bando() = bando
  method posicionInicial() = posicionInicial

  method esMuriendo() = estadoActual.esMuriendo()
  
  method image() = efectoVisual.imagen(estadoActual.imagenActual())

  method cambiarEstado(nuevoEstado) {
    estadoActual.finalizarAnimacion()
    estadoActual = nuevoEstado
  }

  method mover(direccion) { estadoActual.mover(direccion) }
  method disparar() { estadoActual.disparar() }
  method siguienteArma() { estadoActual.siguienteArma() }
  method prepararPaso() { estadoActual.prepararPaso() }

  method restarSalud(dano) { salud = (salud - dano).max(0) }
  method sinSalud() = salud <= 0
  method restaurarSalud() { salud = tipoPersonaje.saludMaxima() }
  method perderVida() { vidas -= 1 }
  method tieneVidas() = vidas > 0

  method colisionaCon(disparo) {
    if (bando.puedeColisionarCon(disparo.bando())) {
      estadoActual.recibirImpacto(disparo.dano())
      disparo.destruir()
    }
  }

  method colisionaConObjeto(objeto) {
    if (bando.puedeColisionarCon(objeto.bando())) {
      self.morir()
      objeto.morir()
    }
  }

  method cambiarEfecto(nuevoEfecto) {
    efectoVisual.detener()
    efectoVisual = nuevoEfecto
  }

  method quitarEfecto() {
      efectoVisual = sinEfecto
  }

  method retirar() {
    game.removeVisual(self)
    estadoActual.finalizarAnimacion()
    efectoVisual.detener()
    reloj.olvidar(self)
  }

  method morir() {
    // Forzamos que la salud llegue a 0 y disparamos el impacto final que cambia el estado a muriendo
    self.restarSalud(salud)
    estadoActual.recibirImpacto(0)
  }

  method iniciar() { }
  method alQuedarseSinVidas() { }
  method dejarFormacion() { }
  method estaEnFormacion() = false
}