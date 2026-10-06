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
    "recursos/disparos/disparosRojos/disparo-frame1.png",
    "recursos/disparos/disparosRojos/disparo-frame2.png",
    "recursos/disparos/disparosRojos/disparo-frame3.png"
  ],
  velocidad = 2,
  dano = 1,
  municion = 0

)
