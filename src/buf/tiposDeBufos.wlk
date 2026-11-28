import src.mecanicas.animaciones.recursos.recursosArmas.*
import src.mecanicas.animaciones.recursos.recursosBufos.*
import src.mecanicas.armas.armasNave.*
import src.mecanicas.armas.clasesDeArmas.armaBasica.*
import src.mecanicas.armas.clasesDeArmas.armasLaser.*
import src.mecanicas.armas.clasesDeArmas.armasMultiples.*
import src.buf.buf.*

const tiposDeBufos = [
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoLaserRecursos,
      fabricaArma = { new ArmaLaser(
          iconoHud = "armaLaserNaveHUD.png",
          recursoBala = armaLaserNave,
          danoBala = 1,
          municion = 20 // 10 disparos
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoPlasmaRecursos,
      fabricaArma = { new ArmaDePlasma(
          iconoHud = "armaPlasmaNaveHUD.png",
          recursoBala = armaDePlasmaNave,
          danoBala = 3,
          municion = 40 // 10 disparos
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoDobleCanonRecursos,
      fabricaArma = { new DobleCanon(
          iconoHud = "armaLaserDobleNaveHUD.png",
          recursoBala = armaLaserNave,
          danoBala = 1,
          municion = 20 // 10 disparos
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoTripleCanonRecursos,
      fabricaArma = { new TripleCanon(
          iconoHud = "armaLaserTripleNaveHUD.png",
          recursoBala = armaLaserNave,
          danoBala = 1,
          municion = 15 // 5 disparos
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoDobleCanonPesadoRecursos,
      fabricaArma = { new DobleCanon(
          iconoHud = "armaPlasmaDobleNaveHUD.png",
          recursoBala = armaDePlasmaNave,
          danoBala = 3,
          municion = 20 // 10 disparos
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoTripleCanonPesadoRecursos,
      fabricaArma = { new TripleCanon(
          iconoHud = "armaPlasmaTripleNaveHUD.png",
          recursoBala = armaDePlasmaNave,
          danoBala = 3,
          municion = 30 // 10 disparos
        ) }
    ) },

  { pos => new BufoVida(
      position = pos,
      recursoAnimacion = bufoVidaRecursos
    ) },

  { pos => new BufoEscudo(
      position = pos,
      recursoAnimacion = bufoEscudoRecursos
    ) },

  { pos => new BufoBloqueo(
      position = pos,
      recursoAnimacion = bufoBloqueoRecursos
    ) }
]