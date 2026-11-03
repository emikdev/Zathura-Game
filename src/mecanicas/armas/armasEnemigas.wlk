import src.mecanicas.armas.armas.*
import src.mecanicas.animaciones.recursos.recursosArmas.*


// 1. Arma Enemiga Básica (Requiere pasarle un recurso de animación y daño)
class ArmaEnemigaBasica inherits Arma {
  override method consumirMunicion() {}
}

// intanciacion de armas
// Arma Basica Enemiga
const armaEnemigaBasica = new ArmaEnemigaBasica(
  danoBala = 1,
  recursoBala = armaEnemigaBasicaRecursos,
  municion = 100
) 

// Arma Cargada Enemiga (Usada por Mosca)
const armaCargadaEnemiga = new ArmaEnemigaBasica(
  recursoBala = armaEnemigaCargadaRecursos,
  danoBala = 3,      
  municion = 10
)

// 2. Arma Pesada Enemiga (Usada por Heavy)
const armaPesadaEnemiga = new ArmaEnemigaBasica(
  recursoBala = armaEnemigaPesadaRecursos,
  danoBala = 3,
  municion= 10  
)

// 3. Arma Rápida Enemiga (Usada por Medusa y Sepia)
const armaRapidaEnemiga = new ArmaEnemigaBasica(
  recursoBala = armaEnemigaRapidaRecursos,
  danoBala = 2,
  municion = 20       
)
