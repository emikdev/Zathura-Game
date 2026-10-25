import src.mecanicas.armas.armas.*
// Armas de la nave del jugador 
class ArmaLaser inherits Arma {
  var property municion = 10 // Cantidad de balas iniciales para armas limitadas

  // Verifica si le quedan balas en el cargador
  override method hayMunicion() = municion > 0

  //Resta una bala cada vez que se efectúa un disparo exitoso
  override method consumirMunicion() {
    municion = (municion - 1) // Evita que baje de cero
  }

}

class ArmaDePlasma inherits ArmaLaser{
    
}

// Instancias de armas listas para la nave

// Arma Láser Estándar (Munición Limitada, daño medio)
const laserEstandar = new ArmaLaser(
  framesBala = [
    "ArmaLaser_frame_1.png",
    "ArmaLaser_frame_2.png",
    "ArmaLaser_frame_3.png"
  ],
  velocidadBala = 5,
  danoBala = 5,
  municion = 30
)

// Cañón de Plasma Pesado (Pocas balas, gran daño, velocidad lenta)
const cañonPlasma = new ArmaDePlasma(
  framesBala = [
    "ArmaDePlasma_frame_1.png",
    "ArmaDePlasma_frame_2.png",
    "ArmaDePlasma_frame_3.png"
  ],
  velocidadBala = 10,
  danoBala = 10,
  municion = 10
)