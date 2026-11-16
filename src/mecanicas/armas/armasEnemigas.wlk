import src.mecanicas.armas.clasesDeArmas.armaBasica.*
import src.mecanicas.armas.clasesDeArmas.armasMultiples.*
import src.mecanicas.animaciones.recursos.recursosArmas.*
import src.menu.configuracion.*

// Los cañones enemigos tienen munición de sobra: el arsenal descarta las armas
// sin munición y un enemigo nunca debe quedarse sin armas.
const municionIlimitada = 999999

// Básicas (infinitas)

const armaEnemigaBasica = new ArmaBasica(
    danoBala = 1,
    recursoBala = armaEnemigaBlanca,
    municion = 100
)

// Variantes de color de la básica
const armaEnemigaBasicaAmarilla = new ArmaBasica(
    danoBala = 3,
    recursoBala = armaEnemigaAmarilla,
    municion = 100
)

const armaEnemigaBasicaAzul = new ArmaBasica(
    danoBala = 3,
    recursoBala = armaEnemigaAzul,
    municion = 100
)

const armaEnemigaBasicaRoja = new ArmaBasica(
    danoBala = 3,
    recursoBala = armaEnemigaRoja,
    municion = 100
)

const armaEnemigaBasicaMorada = new ArmaBasica(
    danoBala = 1,
    recursoBala = armaEnemigaMorada,
    municion = 100
)

// Variantes de daño y velocidad

// Pesada (usada por Heavy's y Mosca): la que más daño hace
const armaPesadaEnemiga = new ArmaBasica(
    recursoBala = armaEnemigaPesada,
    danoBala = 3,
    municion = 10
)

// Rápida (usada por Medusa y Sepia): la bala avanza el doble de rápido que la básica
const armaRapidaEnemiga = new ArmaBasica(
    recursoBala = armaEnemigaMoradaRapida,
    danoBala = 1,
    municion = 20
)

// Cañón doble por color

const armaDobleAmarilla = new DobleCanon(
    recursoBala = armaEnemigaAmarilla,
    danoBala = 1,
    municion = municionIlimitada
)

const armaDobleAzul = new DobleCanon(
    recursoBala = armaEnemigaAzul,
    danoBala = 1,
    municion = municionIlimitada
)

const armaDobleRoja = new DobleCanon(
    recursoBala = armaEnemigaRoja,
    danoBala = 1,
    municion = municionIlimitada
)

// Cañón triple por color (para los cangrejos)

const armaTripleAmarilla = new TripleCanon(
    recursoBala = armaEnemigaAmarilla,
    danoBala = 1,
    municion = municionIlimitada
)

const armaTripleAzul = new TripleCanon(
    recursoBala = armaEnemigaAzul,
    danoBala = 1,
    municion = municionIlimitada
)

const armaTripleRoja = new TripleCanon(
    recursoBala = armaEnemigaRoja,
    danoBala = 1,
    municion = municionIlimitada
)