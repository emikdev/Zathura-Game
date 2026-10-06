import src.mecanicas.comportamiento.ataque.comportamientoAtaque.*
// Define el comportamiento común de todos los ataques
class AtaqueProbabilistico inherits ComportamientoAtaque {

  const probabilidad
  const bala

  override method actuar(enemigo) {

    if (self.ocurre(probabilidad)) {

      enemigo.intentarDisparar(bala)

    }

  }

}