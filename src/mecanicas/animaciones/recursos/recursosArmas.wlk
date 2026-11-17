import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*

// ==========================================
// ARMAS DE LAS NAVES (JUGADOR)
// ==========================================

const armaBasicaNave = new RecursoDeAnimacion(
  frames = [
    "disparoCeleste_frame_1.png",
    "disparoCeleste_frame_2.png",
    "disparoCeleste_frame_3.png"
  ],
  duracion = 90
)

const armaLaserNave = new RecursoDeAnimacion(
  frames = [
    "ArmaLaser_frame_1.png",
    "ArmaLaser_frame_2.png",
    "ArmaLaser_frame_3.png"
  ],
  duracion = 30
)

const armaDePlasmaNave = new RecursoDeAnimacion(
  frames = [
    "ArmaDePlasma_frame_1.png",
    "ArmaDePlasma_frame_2.png",
    "ArmaDePlasma_frame_3.png"
  ],
  duracion = 100
)

// ==========================================
// ARMAS ENEMIGAS
// ==========================================

// Básicas
const armaEnemigaBlanca = new RecursoDeAnimacion(
  frames = [
    "disparoBlanco_frame_1.png",
    "disparoBlanco_frame_2.png",
    "disparoBlanco_frame_3.png"
  ],
  duracion = 160
)

const armaEnemigaAmarilla = new RecursoDeAnimacion(
  frames = [
    "disparoAmarillo_frame_1.png",
    "disparoAmarillo_frame_2.png",
    "disparoAmarillo_frame_3.png"
  ],
  duracion = 150
)

const armaEnemigaAzul = new RecursoDeAnimacion(
  frames = [
    "disparoAzul_frame_1.png",
    "disparoAzul_frame_2.png",
    "disparoAzul_frame_3.png"
  ],
  duracion = 150
)

const armaEnemigaRoja = new RecursoDeAnimacion(
  frames = [
    "disparoRojo_frame_1.png",
    "disparoRojo_frame_2.png",
    "disparoRojo_frame_3.png"
  ],
  duracion = 150
)

const armaEnemigaMorada = new RecursoDeAnimacion(
  frames = [
    "disparoVioleta_frame_1.png",
    "disparoVioleta_frame_2.png",
    "disparoVioleta_frame_3.png"
  ],
  duracion = 160
)

// Especiales
const armaEnemigaPesada = new RecursoDeAnimacion(
  frames = [
    "disparoPesadoBlanco_frame_1.png",
    "disparoPesadoBlanco_frame_2.png",
    "disparoPesadoBlanco_frame_3.png"
  ],
  duracion = 200
)

// Disparo rápido: comparte la lista de frames de la bala morada con la mitad de duración
const armaEnemigaMoradaRapida = new RecursoDeAnimacion(
  frames = armaEnemigaMorada.frames(),
  duracion = armaEnemigaMorada.duracion() / 2
)
