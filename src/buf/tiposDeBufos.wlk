import src.mecanicas.animaciones.recursos.recursosArmas.*
import src.mecanicas.animaciones.recursos.recursosBufos.*
import src.mecanicas.armas.clasesDeArmas.armasLaser.*
import src.mecanicas.armas.clasesDeArmas.armasMultiples.*
import src.buf.buf.*

const tiposDeBufos = [
  // Láser estándar (10 disparos)
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoLaserRecursos,
      fabricaArma = { new ArmaLaser(
          iconoHud = "armaLaserNaveHUD.png",
          recursoBala = armaLaserNave,
          danoBala = 1,
          municion = 20
        ) }
    ) },

  // Cañón de plasma pesado (10 disparos)
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoPlasmaRecursos,
      fabricaArma = { new ArmaDePlasma(
          iconoHud = "armaPlasmaNaveHUD.png",
          recursoBala = armaDePlasmaNave,
          danoBala = 3,
          municion = 40
        ) }
    ) },

  // Doble cañón láser (10 ráfagas)
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoDobleCanonRecursos,
      fabricaArma = { new DobleCanon(
          iconoHud = "armaLaserDobleNaveHUD.png",
          recursoBala = armaLaserNave,
          danoBala = 1,
          municion = 20
        ) }
    ) },

  // Triple cañón láser (5 ráfagas)
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoTripleCanonRecursos,
      fabricaArma = { new TripleCanon(
          iconoHud = "armaLaserTripleNaveHUD.png",
          recursoBala = armaLaserNave,
          danoBala = 1,
          municion = 15
        ) }
    ) },

  // Doble cañón pesado de plasma (2 ráfagas) - NUEVO
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoDobleCanonRecursos, // Cambialo si tenés un recurso visual específico para el pesado
      fabricaArma = { new DobleCanon(
          iconoHud = "armaPlasmaDobleHUD.png",
          recursoBala = armaDePlasmaNave,
          danoBala = 3,
          municion = 4
        ) }
    ) },

  // Triple cañón pesado de plasma (2 ráfagas) - NUEVO
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoTripleCanonRecursos, // Cambialo si tenés un recurso visual específico para el pesado
      fabricaArma = { new TripleCanon(
          iconoHud = "armaPlasmaTripleNaveHUD.png",
          recursoBala = armaDePlasmaNave,
          danoBala = 3,
          municion = 6
        ) }
    ) },

  // Vida extra
  { pos => new BufoVida(
      position = pos,
      recursoAnimacion = bufoVidaRecursos
    ) },

  // Escudo temporal
  { pos => new BufoEscudo(
      position = pos,
      recursoAnimacion = bufoEscudoRecursos
    ) },

  // Bloqueo de disparos enemigos
  { pos => new BufoBloqueo(
      position = pos,
      recursoAnimacion = bufoBloqueoRecursos
    ) }
]
