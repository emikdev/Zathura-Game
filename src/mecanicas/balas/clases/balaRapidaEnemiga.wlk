import src.mecanicas.balas.bala.*

// Clase representativa de la bala rapida utilizada por Medusa y Sepia
class BalaRapidaEnemiga inherits Bala {

  override method consumirMunicion() {

    // Los enemigos tienen municion infinita, no se consume.

  }

  override method tieneMunicion() {

    return true

  }

}

const balaRapidaEnemiga = new BalaRapidaEnemiga(

  frames = [
    "recursos/disparos/disparosAzules/disparo-frame1.png",
    "recursos/disparos/disparosAzules/disparo-frame2.png",
    "recursos/disparos/disparosAzules/disparo-frame3.png"
  ],
  velocidad = 4,
  dano = 1,
  municion = 0

)
