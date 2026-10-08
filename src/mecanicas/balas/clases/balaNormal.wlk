import src.mecanicas.balas.bala.*

// Representa la bala basica con municion infinita
class BalaNormal inherits Bala {

  override method consumirMunicion() {

    // La bala normal tiene municion infinita, no se consume.

  }

  override method tieneMunicion() {

    return true

  }

}

const balaNormal = new BalaNormal(

  frames = [
    "disparoCeleste-frame1.png",
    "disparoCeleste-frame2.png",
    "disparoCeleste-frame3.png"
  ],
  velocidad = 5,
  dano = 3,
  municion = 1

)
