import src.mecanicas.animaciones.animacion.*

class EstadoMuro {

  const muro
  var animacion

  method initialize() {
    animacion = self.crearAnimacion()
  }

  method crearAnimacion()
  method recibirImpacto()
  method colisionaCon(disparo)
  method destruirse()
  method terminoAnimacion()

  method imagenActual() {
    return animacion.frameActual()
  }

  method finalizarAnimacion() {
    animacion.detener()
  }

  method esEnPie() = false

}