import wollok.game.*
import src.gestores.gestorNiveles.*
import src.gestores.gestorMuros.*
import src.menu.configuracion.*
import src.personajes.factory.factory.*
import src.mecanicas.formacion.*

class Nivel {
  const disposiciones   // Lista de Disposicion (el plano)
  var indiceActual = 0  
  
  const formacionesEnJuego = [] // Formaciones activas (normalmente una pero es una lista para usar operadores)

  method iniciar() {
      indiceActual = 0
      formacionesEnJuego.clear() // Limpiamos cualquier resto del nivel anterior
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
    /* Nos aseguramos de que la formación que avisa sea la actual
     (evita que dos enemigos mueran juntos y avancen dos veces) */
    if (not formacionesEnJuego.isEmpty() && formacionesEnJuego.first() == formacionAvisante) {
      formacionesEnJuego.clear() // Limpiamos la formación terminada
      
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

  // Delegación de colisiones
  method hayEnemigoEn(posicion, disparo) {
    // Le preguntamos a todas las formaciones activas (en la práctica, solo hay 1)
    formacionesEnJuego.forEach({ f => f.hayEnemigoEn(posicion, disparo) })
  }
}