import src.mecanicas.balas.bala.*

// Clase representativa de la bala cargada utilizada por Mosca
class BalaCargadaEnemiga inherits Bala {

  override method consumirMunicion() {

    // Los enemigos tienen municion infinita, no se consume.

  }

  override method tieneMunicion() {

    return true

  }

}

const balaCargadaEnemiga = new BalaCargadaEnemiga(

  frames = [
    "recursos/disparos/disparosAmarillos/disparo-frame1.png",
    "recursos/disparos/disparosAmarillos/disparo-frame2.png",
    "recursos/disparos/disparosAmarillos/disparo-frame3.png"
  ],
  velocidad = 2,
  dano = 3,
  municion = 0

)
