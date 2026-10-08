import src.mecanicas.comportamiento.ataque.comportamientoAtaque.*
class AtaqueConInmolacion inherits ComportamientoAtaque {

  const probabilidadInmolacion
  const probabilidadDisparo

  const bala

  override method actuar(enemigo) {

    if (self.ocurre(probabilidadInmolacion)) {

      enemigo.inmolarse()

    } else if (self.ocurre(probabilidadDisparo)) {

      enemigo.intentarDisparar(bala)

    }

  }

}