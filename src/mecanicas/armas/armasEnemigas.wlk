import src.mecanicas.armas.armas.*
import src.mecanicas.animaciones.animacion.*
import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*


// 1. Arma Enemiga Básica (Requiere pasarle un recurso de animación y daño)
const armaEnemigaBasica = new Arma(
  dano = 1,
  recursoBala = new RecursosDeAnimacion(
    frames = ["disparoBasicoEnemigo_frame_1.png"]
  )
) 

// Arma Cargada Enemiga (Usada por Mosca)
class ArmaCargadaEnemiga inherits Arma {
  var property municion 
  override method hayMunicion() = municion > 0 
  override method consumirMunicion() {
    municion -= 1
  } 
}

const armaCargadaEnemiga = new ArmaCargadaEnemiga(
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "disparoAmarilloEnemigo_frame_1.png",
      "disparoAmarilloEnemigo_frame_2.png",
      "disparoAmarilloEnemigo_frame_3.png"
    ]
  ),
  dano = 3,      
  municion = 10
)

// 2. Arma Pesada Enemiga (Usada por Heavy)
class ArmaPesadaEnemiga inherits Arma {
  var property municion = 10

  override method hayMunicion() = municion > 0
  override method consumirMunicion() {
    municion -= 1 
  } 
}

const armaPesadaEnemiga = new ArmaPesadaEnemiga(
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "disparoVioletaEnemigo_frame_1.png",
      "disparoVioletaEnemigo_frame_2.png",
      "disparoVioletaEnemigo_frame_3.png"
    ] 
  ),
  dano = 3       
)

// 3. Arma Rápida Enemiga (Usada por Medusa y Sepia)
class ArmaRapidaEnemiga inherits ArmaPesadaEnemiga {}

const armaRapidaEnemiga = new ArmaRapidaEnemiga(
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "disparoAzulEnemigo_frame_1.png",
      "disparoAzulEnemigo_frame_2.png",
      "disparoAzulEnemigo_frame_3.png"
    ]
  ),
  dano = 2       
)
