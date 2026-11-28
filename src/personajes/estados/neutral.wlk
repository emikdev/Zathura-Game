import src.personajes.estados.estadoPersonaje.*

class Neutral inherits EstadoPersonaje {
  override method recursoAnimacion() = personaje.animacionBase()
  override method autoAvanceAnimacion() = not personaje.estaEnFormacion()
  override method prepararPaso() { animacion.avanzarFrameBase() }
  override method terminoAnimacion() { animacion.reiniciar() }
  override method cambiarANeutral() { }
}