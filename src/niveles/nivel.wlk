import wollok.game.*
import src.mecanicas.gestores.gestorNiveles.*
import src.mecanicas.gestores.gestorDeMuros.*
import src.mecanicas.gestores.gestorDisparos.*
import src.menu.configuracion.*
import src.personajes.factory.factory.*
import src.niveles.formacion.*

class Nivel {

  const formaciones
  var actual = 0

  method iniciar() {
    actual = 0
    gestorMuros.iniciar(configuracion.dificultad())
    self.lanzarFormacion()
  }

  method formacionActual() {
    return formaciones.get(actual)
  }

  method hayFormacionesPendientes() {
    return actual < formaciones.size() - 1
  }

  method lanzarFormacion() {
    gestorJugador.limpiar()
    gestorEnemigos.limpiar()
    const disposicion = self.formacionActual()
    const formacion = new Formacion(nivel = self, intervalo = disposicion.intervalo())

    disposicion.celdas().forEach({ celda =>
      const enemigo = factory.crearEnemigo(celda.first(), formacion, celda.last())
      formacion.agregar(enemigo)
      game.addVisual(enemigo)
    })

    formacion.iniciar()
  }

  method formacionVacia() {
    if (self.hayFormacionesPendientes()) {
      actual += 1
      self.lanzarFormacion()
    } else {
      self.nivelTerminado()
    }
  }

  method nivelTerminado() {
    gestorMuros.detener()
    gestorNiveles.terminarNivel()
  }
}
