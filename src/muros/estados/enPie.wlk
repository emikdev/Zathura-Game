import src.muros.estados.estadoMuro.*
import src.muros.estados.destruyendose.*
import src.muros.animacion.animacionPorImpacto.*

class EnPie inherits EstadoMuro {

  override method crearAnimacion() {
    return new AnimacionPorImpacto(
      estado = self,
      recursoDeAnimacion = muro.animacionBase(),
      frameActual = muro.impactosIniciales()   // en dificultades altas arranca más destruido
    )
  }

  // Cada impacto hace avanzar un frame hacia "más destruido"
  override method recibirImpacto() {
    animacion.avanzar()
  }

  override method colisionaCon(disparo) {
    self.recibirImpacto()
    disparo.destruir()
  }

  // Choque con un enemigo: se destruye sin pasar por los frames intermedios
  override method destruirse() {
    self.pasarADestruyendose()
  }

  // La animación por impacto llegó al final: el muro ya no aguanta más
  override method terminoAnimacion() {
    self.pasarADestruyendose()
  }

  method pasarADestruyendose() {
    muro.cambiarEstado(new Destruyendose(muro = muro))
  }

}