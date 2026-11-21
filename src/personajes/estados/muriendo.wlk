import wollok.game.*

import src.personajes.estados.estadoPersonaje.*
import src.personajes.efectos.efectosPersonaje.*
import src.personajes.estados.neutral.*

import src.sonidos.sonido.*
import src.gestores.reloj.*

class Muriendo inherits EstadoPersonaje {
  var tiempoRestante = 3000

  override method initialize() {
    super()
    personaje.quitarEfecto()
    personaje.perderVida()
    personaje.dejarFormacion()
    reloj.registrar(self) // Lo registramos para contar el tiempo
  }

  override method recursoAnimacion() = personaje.animacionMuerte()
  override method autoAvanceAnimacion() = true

  override method finalizarAnimacion() {
    super() // Detiene la animación
    reloj.olvidar(self) // Sacamos del reloj al salir del estado
  }

  override method terminoAnimacion() {
    animacion.detener()
    game.removeVisual(personaje)
    
    if (personaje.tieneVidas()) {
      sonido.reproducir("pierdeVida.mp3")
      // Ya estamos registrados en el reloj, solo esperamos que pase el tiempo
    } else {
      sonido.reproducir("muerteDefinitiva.mp3")
      reloj.olvidar(self) // Si no tiene vidas, no necesitamos esperar
      personaje.alQuedarseSinVidas()
    }
  }

  method tick(deltaMs) {
    if (personaje.tieneVidas()) {
      tiempoRestante -= deltaMs
      if (tiempoRestante <= 0) {
        self.reaparecer()
      }
    }
  }

  method reaparecer() {
    personaje.restaurarSalud()
    personaje.position(personaje.posicionInicial())
    game.addVisual(personaje)
    self.cambiarANeutral()
  }

  override method mover(direccion) { }
  override method disparar() { }
  override method recibirImpacto(dano) { }
  override method siguienteArma() { }
  override method seleccionarArma(slot) { }
}