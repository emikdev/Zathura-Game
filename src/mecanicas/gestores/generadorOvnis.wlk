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

  // Sortea el lado por el que aparece y delega el lanzamiento
  method lanzar() {
    self.lanzarDesde(0.randomUpTo(2) < 1)
  }

  // Lanzamiento determinista: recibe el lado y devuelve el ovni creado
  method lanzarDesde(haciaDerecha) {
    const direccion = if (haciaDerecha) derecha else izquierda
    const x = if (haciaDerecha) 0 else game.width() - 1

    const travesia = new Travesia(intervalo = 250, direccion = direccion)
    const ovniClasico = factory.crearEnemigo(ovni, travesia, game.at(x, tablero.filaMaxima()))
    travesia.agregar(ovniClasico)
    game.addVisual(ovniClasico)
    travesia.iniciar()
    return ovniClasico
  }

}