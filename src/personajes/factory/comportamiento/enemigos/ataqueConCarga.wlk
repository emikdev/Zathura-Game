import src.mecanicas.comportamiento.ataque.comportamientoAtaque.*
class AtaqueConCarga inherits ComportamientoAtaque {

  const probabilidadAtaque
  const probabilidadCarga

  const balaNormal
  const balaCargada

  override method actuar(enemigo) {

    if (self.ocurre(probabilidadAtaque)) {

      if (self.ocurre(probabilidadCarga)) {

        enemigo.intentarDisparar(balaCargada)

      } else {

        enemigo.intentarDisparar(balaNormal)

      }

    }

  }

}