import src.mecanicas.balas.bala.*

// Clase representativa de la bala pesada utilizada por enemigos Heavy
class BalaPesadaEnemiga inherits Bala {

  override method consumirMunicion() {

    // Los enemigos tienen municion infinita, no se consume.

  }

  override method tieneMunicion() {

    return true

  }

}

const balaPesadaEnemiga = new BalaPesadaEnemiga(

  frames = [
    "recursos/disparos/disparosVioleta/disparo-frame1.png",
    "recursos/disparos/disparosVioleta/disparo-frame2.png",
    "recursos/disparos/disparosVioleta/disparo-frame3.png"
  ],
  velocidad = 1,
  dano = 3,
  municion = 0

)
