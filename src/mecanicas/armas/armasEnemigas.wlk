import src.mecanicas.armas.clasesDeArmas.armaBasica.*
import src.mecanicas.armas.clasesDeArmas.armasMultiples.*
import src.mecanicas.animaciones.recursos.recursosArmas.*
import src.menu.configuracion.*

// Los cañones enemigos tienen munición de sobra: el arsenal descarta las armas
// sin munición y un enemigo nunca debe quedarse sin armas.
const municionIlimitada = 999999

// Básicas (infinitas)

const armaEnemigaBasica = new ArmaBasica(
    iconoHud = "armaBasicaEnemigaHUD.png",
    danoBala = 1,
    recursoBala = armaEnemigaBlanca,
    municion = 100
)

// Variantes de color de la básica
const armaEnemigaBasicaAmarilla = new ArmaBasica(
    iconoHud = "armaAmarillaEnemigaHUD.png",
    danoBala = 3,
    recursoBala = armaEnemigaAmarilla,
    municion = 999
)

const armaEnemigaBasicaAzul = new ArmaBasica(
    iconoHud = "armaAzulEnemigaHUD.png",
    danoBala = 3,
    recursoBala = armaEnemigaAzul,
    municion = 100
)

const armaEnemigaBasicaRoja = new ArmaBasica(
    iconoHud = "armaRojaEnemigaHUD.png",
    danoBala = 3,
    recursoBala = armaEnemigaRoja,
    municion = 100
)

const armaEnemigaBasicaMorada = new ArmaBasica(
    iconoHud = "armaMoradaEnemigaHUD.png",
    danoBala = 1,
    recursoBala = armaEnemigaMorada,
    municion = 999
)

// Variantes de daño y velocidad

// Pesada (usada por Heavy's y Mosca): la que más daño hace
const armaPesadaEnemiga = new ArmaBasica(
    iconoHud = "armaPesadaHUD.png",
    recursoBala = armaEnemigaPesada,
    danoBala = 3,
    municion = 10
)

// Rápida (usada por Medusa y Sepia): la bala avanza el doble de rápido que la básica
const armaRapidaEnemiga = new ArmaBasica(
    iconoHud = "armaMoradaEnemigaHUD.png",
    recursoBala = armaEnemigaMoradaRapida,
    danoBala = 3,
    municion = 999
)

// Cañón doble por color

const armaDobleAmarilla = new DobleCanon(
    iconoHud = "armaAmarillaDobleEnemigaHUD.png",
    recursoBala = armaEnemigaAmarilla,
    danoBala = 5,
    municion = municionIlimitada
)

const armaDobleAzul = new DobleCanon(
    iconoHud = "armaAzulDobleEnemigaHUD.png",
    recursoBala = armaEnemigaAzul,
    danoBala = 5,
    municion = municionIlimitada
)

const armaDobleRoja = new DobleCanon(
    iconoHud = "armaRojaDobleEnemigaHUD.png",
    recursoBala = armaEnemigaRoja,
    danoBala = 5,
    municion = municionIlimitada
)

// Cañón triple por color (para los cangrejos)

const armaTripleAmarilla = new TripleCanon(
    iconoHud = "armaAmarillaTripleEnemigaHUD.png",
    recursoBala = armaEnemigaAmarilla,
    danoBala = 5,
    municion = municionIlimitada
)

const armaTripleAzul = new TripleCanon(
    iconoHud = "armaAzulTripleEnemigaHUD.png",
    recursoBala = armaEnemigaAzul,
    danoBala = 5,
    municion = municionIlimitada
)

const armaTripleRoja = new TripleCanon(
    iconoHud = "armaRojaTripleEnemigaHUD.png",
    recursoBala = armaEnemigaRoja,
    danoBala = 5,
    municion = municionIlimitada
)