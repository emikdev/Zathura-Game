import src.mecanicas.armas.armas.*
import src.mecanicas.animaciones.animacion.*
import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*


// 1. Arma Enemiga Básica (Requiere pasarle un recurso de animación y daño)
class ArmaEnemigaBasica inherits Arma {
  override method consumirMunicion() {}
}

// intanciacion de armas
// Arma Basica Enemiga
const armaEnemigaBasica = new ArmaEnemigaBasica(
  danoBala = 1,
  recursoBala = new RecursoDeAnimacion(
    frames = ["disparoBlanco_frame_2","disparoBlanco_frame_2","disparoBlanco_frame_2"]
  ),
  municion = 100
) 

// Arma Cargada Enemiga (Usada por Mosca)
const armaCargadaEnemiga = new ArmaEnemigaBasica(
  recursoBala = new RecursoDeAnimacion(
    frames = [
      "disparoAmarillo_frame_1.png",
      "disparoAmarillo_frame_2.png",
      "disparoAmarillo_frame_3.png"
    ]
  ),
  danoBala = 3,      
  municion = 10
)

// 2. Arma Pesada Enemiga (Usada por Heavy)
const armaPesadaEnemiga = new ArmaEnemigaBasica(
  recursoBala = new RecursoDeAnimacion(
    frames = [
      "disparoVioleta_frame_1.png",
      "disparoVioleta_frame_2.png",
      "disparoVioleta_frame_3.png"
    ] 
  ),
  danoBala = 3,
  municion= 10  
)

// 3. Arma Rápida Enemiga (Usada por Medusa y Sepia)
const armaRapidaEnemiga = new ArmaEnemigaBasica(
  recursoBala = new RecursoDeAnimacion(
    frames = [
      "disparoAzul_frame_1.png",
      "disparoAzul_frame_2.png",
      "disparoAzul_frame_3.png"
    ]
  ),
  danoBala = 2,
  municion = 20       
)
