import wollok.game.*
import src.muros.muros.*

/* Recurso de animación con los frames que se le pasen. La duración enorme evita que el
 temporizador de Animacion la avance sola durante un test. */
class RecursoFramesMock {
  const frames
  const duracion = 1000000

  method frames() = frames
  method duracion() = duracion
}

// Estado falso de una animación: solo cuenta cuántas veces le avisaron que terminó.
class EstadoAnimacionMock {
  var terminos = 0

  method terminoAnimacion() { terminos += 1 }

  method terminos() = terminos
}

// Objeto que choca contra un muro: lo único que se le pide es morir().
class ObjetoMock {
  var muertes = 0

  method morir() { muertes += 1 }

  method muertes() = muertes
}

// Arma muros reales con recursos mock: 4 frames de muro en pie (muro0..muro3) y 2 de muerte (muerte0..muerte1).
object fabricaDeMuros {

  method muro() = self.muroConImpactos(0)

  method muroConImpactos(impactos) = new Muro(
    position = game.at(5, 3),
    animacionBase = new RecursoFramesMock(frames = ["muro0.png", "muro1.png", "muro2.png", "muro3.png"]),
    animacionMuerte = new RecursoFramesMock(frames = ["muerte0.png", "muerte1.png"]),
    impactosIniciales = impactos
  )

}