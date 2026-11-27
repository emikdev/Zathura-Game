import src.muros.estados.estadoMuro.*
import src.mecanicas.animaciones.animacion.*
import src.gestores.gestorMuros.*

class Destruyendose inherits EstadoMuro {

  override method crearAnimacion() {
    return new Animacion(
      estado = self,
      recursoDeAnimacion = muro.animacionMuerte(),
      autoAvance = true // La animación de muerte sí corre por tiempo en el reloj
    )
  }

  override method colisionaCon(disparo) { }

  // Mientras se destruye ignora impactos y choques
  override method recibirImpacto() { }
  override method destruirse() { }

  override method terminoAnimacion() {
    gestorMuros.muroDestruido(muro)
  }

}