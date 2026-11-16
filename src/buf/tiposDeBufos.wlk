import src.mecanicas.animaciones.recursos.recursosArmas.*
import src.mecanicas.animaciones.recursos.recursosBufos.*
import src.mecanicas.armas.armasDeNave.*
import src.buf.buf.*

const tiposDeBufos = [
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoLaserRecursos,
      fabricaArma = { new ArmaLaser(
          recursoBala = armaLaserNave,
          danoBala = 5,
          municion = 30
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoPlasmaRecursos,
      fabricaArma = { new ArmaDePlasma(
          recursoBala = armaDePlasmaNave,
          danoBala = 10,
          municion = 10
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoDobleCanonRecursos,
      fabricaArma = { new DobleCanon(
          recursoBala = armaLaserNave,
          danoBala = 5,
          municion = 4 // 2 rafagas
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoTripleCanonRecursos,
      fabricaArma = { new TripleCanon(
          recursoBala = armaLaserNave,
          danoBala = 7,
          municion = 6 // 2 rafagas
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
