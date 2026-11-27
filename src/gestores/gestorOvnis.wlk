import wollok.game.*
import src.mecanicas.direcciones.*
import src.gestores.reloj.*
import src.personajes.comportamiento.movimiento.travesia.*
import src.personajes.factory.tiposPersonajes.tiposDeOvnis.*
import src.personajes.factory.factory.*

object gestorOvnis {
  const intervaloAparicion = 15000
  const probabilidad = 25
  
  var acumuladoAparicion = 0
  var ovnisActivos = []

  method initialize() {
    reloj.registrar(self)
  }

  method tick(deltaMs) {
    acumuladoAparicion += deltaMs
    if (acumuladoAparicion >= intervaloAparicion) {
      acumuladoAparicion = 0
      self.intentarLanzar()
    }
    ovnisActivos.copy().forEach({ o => o.tick(deltaMs) })
  }

  method intentarLanzar() {
    if (0.randomUpTo(100) < probabilidad) {
      self.lanzar()
    }
  }

  method lanzar() {
    self.lanzarDesde(0.randomUpTo(2) < 1)
  }

method lanzarDesde(haciaDerecha) {
    const direccion = if (haciaDerecha) derecha else izquierda
    const x = if (haciaDerecha) 0 else game.width() - 1

    const travesia = new Travesia(intervalo = 250, direccion = direccion)
    const ovniNuevo = factory.crearOvni(ovniBasico, game.at(x, tablero.filaMaxima()), travesia)
    
    game.addVisual(ovniNuevo)
    ovnisActivos.add(ovniNuevo)
}

  method quitar(ovni) {
    ovnisActivos.remove(ovni)
  }

  method hayOvniEn(posicion, disparo) {
    const ovnisChocados = ovnisActivos.filter({ o => o.position() == posicion })
    if (not ovnisChocados.isEmpty()) {
      ovnisChocados.first().colisionaCon(disparo)
    }
  }

  method detener() {
    ovnisActivos.copy().forEach({ o => o.detener() })
    ovnisActivos.clear()
  }
  
  method limpiar() {
    ovnisActivos.copy().forEach({ o => o.detener() })
    ovnisActivos.clear()
    acumuladoAparicion = 0
  }
}