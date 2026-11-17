import wollok.game.*
import src.mecanicas.gestores.gestorNiveles.*
import src.mecanicas.gestores.gestorDeMuros.*
import src.menu.configuracion.*
import src.personajes.factory.factory.*
import src.niveles.formacion.*

class Nivel {

  const formaciones   // lista de Disposicion, en el orden en que van apareciendo
  var actual = 0      // posición en la lista de la formación que se está jugando

  // Arranca el nivel: los muros se crean una sola vez y después empiezan las formaciones
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

  // Crea la formación en juego a partir de su diseño y coloca a sus enemigos en el tablero
  method lanzarFormacion() {
    const disposicion = self.formacionActual()
    const formacion = new Formacion(nivel = self, intervalo = disposicion.intervalo())

    disposicion.celdas().forEach({ celda =>
      const enemigo = factory.crearEnemigo(celda.first(), formacion, celda.last())
      formacion.agregar(enemigo)
      game.addVisual(enemigo)
    })

    formacion.iniciar()
  }

  // Lo llama la formación cuando se queda sin enemigos
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
