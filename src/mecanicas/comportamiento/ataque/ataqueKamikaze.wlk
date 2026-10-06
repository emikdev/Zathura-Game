import src.mecanicas.comportamiento.ataque.comportamientoAtaque.*
class AtaqueSoloInmolacion inherits ComportamientoAtaque {

  const probabilidadInmolacion

  override method actuar(enemigo) {

    if (self.ocurre(probabilidadInmolacion)) {

      enemigo.inmolarse()

    }

  }

}