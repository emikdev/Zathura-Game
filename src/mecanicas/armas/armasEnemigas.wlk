import src.mecanicas.armas.armas.*
import src.mecanicas.animaciones.animacion.*
import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*


// 1. Arma Enemiga Básica (Requiere pasarle un recurso de animación y daño)
class ArmaEnemigaBasica inherits Arma {
  override method consumirMunicion() {}
}
const armaEnemigaBasica = new ArmaEnemigaBasica(
  danoBala = 1,
  recursoBala = new RecursoDeAnimacion(
    frames = ["disparoBlanco_frame_2","disparoBlanco_frame_2","disparoBlanco_frame_2"]
  ),
  municion = 100
) 

// Arma Cargada Enemiga (Usada por Mosca)
class ArmaCargadaEnemiga inherits Arma {}// hay que configurar que tata municion gasta o gasta lo mismo que arma

const armaCargadaEnemiga = new ArmaCargadaEnemiga(
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
class ArmaPesadaEnemiga inherits Arma {}// hay que configurar que tata municion gasta o gasta lo mismo que arma

const armaPesadaEnemiga = new ArmaPesadaEnemiga(
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
class ArmaRapidaEnemiga inherits ArmaPesadaEnemiga {}// hay que configurar que tata municion gasta o gasta lo mismo que arma

const armaRapidaEnemiga = new ArmaRapidaEnemiga(
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
