import src.mecanicas.animaciones.recursos.recursosArmas.*
import src.mecanicas.animaciones.recursos.recursosBufos.*
import src.mecanicas.armas.armasDeNave.*
import src.buf.buf.*

const tiposDeBufos = [
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoLaserRecursos,
      fabricaArma = { new ArmaLaser(
          recursoBala = armaLaserRecursos,
          danoBala = 5,
          municion = 30
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoPlasmaRecursos,
      fabricaArma = { new ArmaDePlasma(
          recursoBala = armaDePlasmaRecursos,
          danoBala = 10,
          municion = 10
        ) }
    ) },

  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoDobleCanonRecursos,
      fabricaArma = { new DobleCanon(
          recursoBala = armaLaserRecursos,
          danoBala = 5,
          municion = 20
        ) }
    ) },
    
  { pos => new BufoArma(
      position = pos,
      recursoAnimacion = bufoTripleCanonRecursos,
      fabricaArma = { new TripleCanon(
          recursoBala = armaLaserRecursos,
          danoBala = 7,
          municion = 15
        ) }
    ) }
]