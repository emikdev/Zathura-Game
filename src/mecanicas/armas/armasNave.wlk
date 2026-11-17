import src.mecanicas.armas.clasesDeArmas.armaBasica.*
import src.mecanicas.armas.clasesDeArmas.armasLaser.*
import src.mecanicas.armas.clasesDeArmas.armasMultiples.*
import src.mecanicas.animaciones.recursos.recursosArmas.*

// Instancias de armas listas para la nave del jugador

// Arma básica del jugador (infinita)
const armaBasica = new ArmaBasica(
    iconoHud = "armaBasicaNaveHUD.png",
    danoBala = 1,
    recursoBala = armaBasicaNave,
    municion = 100
)

// Arma láser estándar (gasta 2 por disparo)
const laserEstandar = new ArmaLaser(
    iconoHud = "armaLaserNaveHUD.png",
    recursoBala = armaLaserNave,
    danoBala = 1,
    municion = 20 // 10 disparos
)

// Cañón de plasma pesado (gasta 4 por disparo)
const canonPlasma = new ArmaDePlasma(
    iconoHud = "armaPlasmaNaveHUD.png",
    recursoBala = armaDePlasmaNave,
    danoBala = 3,
    municion = 40 // 10 disparos
)

// Doble cañón (gasta 2 por ráfaga; el daño es por cada proyectil)
const dobleCanon = new DobleCanon(
    iconoHud = "armaLaserDobleNaveHUD.png",
    recursoBala = armaLaserNave,
    danoBala = 1,
    municion = 20 // 10 disparos
)

// Triple cañón (gasta 3 por ráfaga; el daño es por cada proyectil)
const tripleCanon = new TripleCanon(
    iconoHud = "armaLaserTripleNaveHUD.png",
    recursoBala = armaLaserNave,
    danoBala = 1,
    municion = 15 // 5 disparos
)

// Doble cañón pesado(gasta 2 por ráfaga; el daño es por cada proyectil)
const dobleCanonPesado = new DobleCanon(
    iconoHud = "armaPlasmaDobleHUD.png",
    recursoBala = armaDePlasmaNave,
    danoBala = 3,
    municion = 4 // 2 disparos
)

// Triple cañón (gasta 3 por ráfaga; el daño es por cada proyectil)
const tripleCanonPesado = new TripleCanon(
    iconoHud = "armaPlasmaTripleNaveHUD.png",
    recursoBala = armaDePlasmaNave,
    danoBala = 3,
    municion = 6 // 2 disparos
)