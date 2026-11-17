import src.muros.estados.estadoMuro.*
import src.mecanicas.animaciones.animacion.*
import src.mecanicas.gestores.gestorDeMuros.*

class Destruyendose inherits EstadoMuro {

  override method crearAnimacion() {
    return new Animacion(estado = self, recursoDeAnimacion = muro.animacionMuerte())
  }

  override method colisionaCon(disparo) { }

  // Mientras se destruye ignora impactos y choques
  override method recibirImpacto() { }
  override method destruirse() { }

  override method terminoAnimacion() {
    gestorMuros.muroDestruido(muro)
  }

}