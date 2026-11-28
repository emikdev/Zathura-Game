import wollok.game.*
import src.gestores.gestorNiveles.*
import src.gestores.gestorMuros.*
import src.menu.configuracion.*
import src.personajes.factory.factory.*
import src.mecanicas.formacion.*

class Nivel {
  const disposiciones   
  var indiceActual = 0  
  const formacionesEnJuego = [] 

  method iniciar() {
    indiceActual = 0
    // Limpiamos por completo las formaciones antes de arrancar
    formacionesEnJuego.clear() 
    
    gestorMuros.iniciar(configuracion.dificultad())
    self.lanzarFormacion()
  }

  method disposicionActual() = disposiciones.get(indiceActual)
  method hayFormacionesPendientes() = indiceActual < disposiciones.size() - 1

  method lanzarFormacion() {
    const plano = self.disposicionActual()
    const nuevaFormacion = new Formacion(nivel = self, intervalo = plano.intervalo())
    
    formacionesEnJuego.add(nuevaFormacion)

    plano.celdas().forEach({ celda =>
      const tipo = celda.first()
      const posicion = celda.last()
      
      const enemigo = factory.crearEnemigo(tipo, nuevaFormacion, posicion)
      nuevaFormacion.agregar(enemigo)
      game.addVisual(enemigo)
    })
  }

  method formacionVacia(formacionAvisante) {
    if (not formacionesEnJuego.isEmpty() && formacionesEnJuego.first() == formacionAvisante) {
      formacionesEnJuego.clear() 
      
      if (self.hayFormacionesPendientes()) {
        indiceActual += 1
        self.lanzarFormacion()
      } else {
        self.nivelTerminado()
      }
    }
  }

  method nivelTerminado() {
    gestorMuros.detener()
    gestorNiveles.terminarNivel()
  }

  method hayEnemigoEn(posicion, disparo) {
    formacionesEnJuego.forEach({ f => f.hayEnemigoEn(posicion, disparo) })
  }

  method limpiarFormacionActual() {
  if (not formacionesEnJuego.isEmpty()) {
    self.formacionVacia(formacionesEnJuego.first())
  }
}
}
