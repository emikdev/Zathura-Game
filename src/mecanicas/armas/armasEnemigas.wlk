import src.mecanicas.armas.armas.*
import src.mecanicas.animador.*
// Armas Enemigas Basica (con municion infinita)
class ArmaEnemiga inherits Arma {
  //Todos los enemigos tienen balas infinitas por defecto
  override method hayMunicion() = true
  override method consumirMunicion() {} 
}

// NUEVAS IMPLEMENTACIONES DE ARMAS ENEMIGAS

// 1. Arma Cargada Enemiga (Usada por Mosca)
class ArmaCargadaEnemiga inherits ArmaEnemiga {
  var municion 
  override method hayMunicion() = municion > 0 
  override method consumirMunicion() {
    municion -= 1
  } 
}

const armaCargadaEnemiga = new ArmaCargadaEnemiga(
  framesBala = [
    "disparoAmarillo_frame_1.png",
    "disparoAmarillo_frame_2.png",
    "disparoAmarillo_frame_3.png"
  ],
  velocidadBala = 2,
  danoBala = 3,
  municion = 10
)

// 2. Arma Pesada Enemiga (Usada por Heavy)
class ArmaPesadaEnemiga inherits ArmaEnemiga {
  var municion = 10

  method municion(){
    return municion
  } 

  override method hayMunicion() {
    return municion > 0
  }
  override method consumirMunicion() {
    municion -= 1 
  } 
}

const armaPesadaEnemiga = new ArmaPesadaEnemiga(
  framesBala = [
    "disparoVioleta_frame_1.png",
    "disparoVioleta_frame_2.png",
    "disparoVioleta_frame_3.png"
  ],
  velocidadBala = 1,
  danoBala = 3
)

// 3. Arma Rápida Enemiga (Usada por Medusa y Sepia)
class ArmaRapidaEnemiga inherits ArmaPesadaEnemiga {}


const armaRapidaEnemiga = new ArmaRapidaEnemiga(
  framesBala = [
    "disparoAzulEnemigo_frame_1.png",
    "disparoAzulEnemigo_frame_2.png",
    "disparoAzulEnemigo_frame_3.png"
  ],
  velocidadBala = 4,
  danoBala = 2
)