import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*

// Armas de las Naves (Jugador)
const armaBasicaNave = new RecursoDeAnimacion(
  frames = [
    "disparoCeleste_frame_1.png",
    "disparoCeleste_frame_2.png",
    "disparoCeleste_frame_3.png"
  ],
  duracion = 400
)

const armaLaserNave = new RecursoDeAnimacion(
  frames = [
    "ArmaLaser_frame_1.png",
    "ArmaLaser_frame_2.png",
    "ArmaLaser_frame_3.png"
  ],
  duracion = 20
)

const armaDePlasmaNave = new RecursoDeAnimacion(
  frames = [
    "ArmaDePlasma_frame_1.png",
    "ArmaDePlasma_frame_2.png",
    "ArmaDePlasma_frame_3.png"
  ],
  duracion = 100
)

// Armas Enemigas
// Basicas
const armaEnemigaBlanca = new RecursoDeAnimacion(
  frames = [
    "disparoBlanco_frame_1.png",
    "disparoBlanco_frame_2.png",
    "disparoBlanco_frame_3.png"
  ]
)

const armaEnemigaAmarilla = new RecursoDeAnimacion(
  frames = [
    "disparoAmarillo_frame_1.png",
    "disparoAmarillo_frame_2.png",
    "disparoAmarillo_frame_3.png"
  ]
)

const armaEnemigaAzul = new RecursoDeAnimacion(
  frames = [
    "disparoAzul_frame_1.png",
    "disparoAzul_frame_2.png",
    "disparoAzul_frame_3.png"
  ]
)

const armaEnemigaRoja = new RecursoDeAnimacion(
  frames = [
    "disparoRojo_frame_1.png",
    "disparoRojo_frame_2.png",
    "disparoRojo_frame_3.png"
  ]
)

const armaEnemigaMorada = new RecursoDeAnimacion(
  frames = [
    "disparoVioleta_frame_1.png",
    "disparoVioleta_frame_2.png",
    "disparoVioleta_frame_3.png"
  ]
)

// Especiales
const armaEnemigaPesada = new RecursoDeAnimacion(
  frames = [
    "disparoPesadoBlanco_frame_1.png",
    "disparoPesadoBlanco_frame_2.png",
    "disparoPesadoBlanco_frame_3.png"
  ]
)

// Disparo rápido: mismos frames que la bala básica a la MITAD de duración.
// Como la bala avanza una celda por ciclo de animación, avanza el doble de rápido.
object armaEnemigaMoradaRapida {
  method frames() = armaEnemigaMorada.frames()
  
  method duracion() = armaEnemigaMorada.duracion() / 2
}