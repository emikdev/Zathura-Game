import src.personajes.factory.comportamiento.enemigos.disparo.*
import src.personajes.factory.comportamiento.enemigos.disparoConArma.*
import src.personajes.factory.comportamiento.enemigos.inmolacion.*
import src.personajes.factory.comportamiento.enemigos.conProbabilidad.*
import src.personajes.factory.comportamiento.enemigos.alternativas.*

// Catálogo de comportamientos de ataque.
// Cada método devuelve instancias NUEVAS, así cada personaje tiene las suyas.
// Uso en un tipo de enemigo: method comportamientoAtaque() = ataques.probabilistico(20)
object ataques {

  // Dispara con el arma equipada, con cierta probabilidad
  method probabilistico(probabilidad) {
    return new ConProbabilidad(
      probabilidad = probabilidad,
      accion = disparo
    )
  }

  // Se inmola con cierta probabilidad
  method soloInmolacion(probabilidadInmolacion) {
    return new ConProbabilidad(
      probabilidad = probabilidadInmolacion,
      accion = inmolacion
    )
  }

  // Primero intenta inmolarse; si no, intenta disparar
  method conInmolacion(probabilidadInmolacion, probabilidadDisparo) {
    return new Alternativas(opciones = [
      self.soloInmolacion(probabilidadInmolacion),
      self.probabilistico(probabilidadDisparo)
    ])
  }

  // Si decide atacar, puede hacerlo con el arma pesada o con la normal.
  // Los slots son los del arsenal del personaje.
  method conCarga(probabilidadAtaque, probabilidadAtaquePesado, slotNormal, slotPesado) {
    return new ConProbabilidad(
      probabilidad = probabilidadAtaque,
      accion = new Alternativas(opciones = [
        new ConProbabilidad(
          probabilidad = probabilidadAtaquePesado,
          accion = new DisparoConArma(slot = slotPesado)
        ),
        new DisparoConArma(slot = slotNormal)
      ])
    )
  }

}