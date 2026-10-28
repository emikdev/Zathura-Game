import src.mecanicas.armas.armas.*
import src.mecanicas.animaciones.animacion.*
import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*

// Arma Básica del Jugador (Infinita, hereda directo de Arma)
const armaBasica = new Arma(
  dano = 2,
  recursoBala = new RecursosDeAnimacion(
    frames = ["ArmaBasica_frame_1.png"], 
    duracion = 2
  )
)

class ArmaLaser inherits Arma {
  var property municion = 10 // el valor siempre tiene que ser par 

  override method hayMunicion() = municion > 0
  override method consumirMunicion() {
    municion = (municion - 2).max(0) // Previene números negativos de forma segura
  }
  override method recargar(cantidad) {
    municion = municion + cantidad
  }
}

class ArmaDePlasma inherits ArmaLaser {
    override method consumirMunicion() {
    municion = (municion - 4).max(0) // Previene números negativos de forma segura
  }
}

// Instancias de armas listas para la nave

// Arma Láser Estándar
const laserEstandar = new ArmaLaser(
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "ArmaLaser_frame_1.png",
      "ArmaLaser_frame_2.png",
      "ArmaLaser_frame_3.png"
    ],
    duracion = 5 // Antes velocidadBala = 5
  ),
  dano = 5,      // Corregido danoBala -> dano
  municion = 30
)

// Cañón de Plasma Pesado
const cañonPlasma = new ArmaDePlasma(
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "ArmaDePlasma_frame_1.png",
      "ArmaDePlasma_frame_2.png",
      "ArmaDePlasma_frame_3.png"
    ],
    duracion = 10 // Antes velocidadBala = 10
  ),
  dano = 10,      // Corregido danoBala -> dano
  municion = 10
)
