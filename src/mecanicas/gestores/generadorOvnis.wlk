import wollok.game.*
import src.mecanicas.direcciones.*
import src.personajes.factory.factory.*
import src.personajes.factory.tiposPersonajes.tiposDeEnemigos.*
import src.niveles.travesia.*

object generadorOvnis {

  const intervalo = 30000   // ms entre cada intento
  const probabilidad = 20   // porcentaje de que aparezca

  method iniciar() {
    game.onTick(intervalo, "generadorOvnis", { self.intentarLanzar() })
  }

  method detener() {
    game.removeTickEvent("generadorOvnis")
  }

  method intentarLanzar() {
    if (0.randomUpTo(100) < probabilidad) {
      self.lanzar()
    }
  }

  method lanzar() {
    const haciaDerecha = 0.randomUpTo(2) < 1
    const direccion = if (haciaDerecha) derecha else izquierda
    const x = if (haciaDerecha) 0 else game.width() - 1

    const travesia = new Travesia(intervalo = 250, direccion = direccion)
    const ovniClasico = factory.crearEnemigo(ovni, travesia, game.at(x, game.height() - 1))
    travesia.agregar(ovniClasico)
    game.addVisual(ovniClasico)
    travesia.iniciar()
  }

}