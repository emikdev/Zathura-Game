import src.mecanicas.balas.bala.*

// Clase representativa de la bala normal utilizada por los enemigos
class BalaNormalEnemiga inherits Bala {

  override method consumirMunicion() {

    // Los enemigos tienen municion infinita, no se consume.

  }

  override method tieneMunicion() {

    return true

  }

}

const balaNormalEnemiga = new BalaNormalEnemiga(

  frames = [
    "disparoBlanco-frame1.png",
    "disparoBlanco-frame2.png",
    "disparoBlanco-frame3.png"
  ],
  velocidad = 4,
  dano = 1,
  municion = 1

)
