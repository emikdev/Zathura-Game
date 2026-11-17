import wollok.game.*
import src.mecanicas.animaciones.recursos.recursosMuros.*
import src.muros.estados.enPie.*
import src.mecanicas.bandos.*

class Muro {

  const property position
  const bando = neutral

  method bando(){
    return bando
  }

  const animacionBase = muroFramesBase  // frames ordenados de entero (índice 0) a más destruido (indice 5)
  const animacionMuerte = muroFramesMuerte // indice llega a 6

  const impactosIniciales = 0 // cuántos frames "destruido" tiene al nacer (según la dificultad)

  var estadoActual
  
  method initialize() {
    estadoActual = new EnPie(muro = self)
  }

  method animacionBase() = animacionBase
  method animacionMuerte() = animacionMuerte

  // Nunca nace destruido del todo: como mucho queda a un impacto de caer
  method impactosIniciales() = impactosIniciales.min(animacionBase.frames().size() - 1)

  method estado() = estadoActual

  method image() = estadoActual.imagenActual()

  method cambiarEstado(nuevoEstado) {
    estadoActual.finalizarAnimacion()
    estadoActual = nuevoEstado
  }

  // Lo llama el gestor al agregar el muro al tablero (en vez de un game.addVisual suelto)
  method iniciar() {
    game.addVisual(self)
    game.onCollideDo(self, { otro => otro.colisionaConMuro(self) })   // personajes: el que choca decide qué le pasa
  }

  // Lo llama el disparo (su onCollideDo): cualquier bando daña al muro
  method colisionaCon(disparo) {
    estadoActual.colisionaCon(disparo)
  }

  // Lo llama el objeto que colisiona
  method colisionaConObjeto(objeto){
    objeto.morir()
    self.morir()
  }

  method recibirImpacto() {
    estadoActual.recibirImpacto()
  }

  // Choque con un enemigo
  method morir() {
    estadoActual.destruirse()
  }

  // Lo saca del tablero y corta su animación (se usa al destruirse o al terminar el nivel)
  method retirar() {
    estadoActual.finalizarAnimacion()
    if (game.hasVisual(self)) game.removeVisual(self)
  }

}