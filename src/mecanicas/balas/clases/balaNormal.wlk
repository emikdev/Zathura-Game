import src.mecanicas.balas.bala.*

// Representa la bala basica con municion infinita
class BalaNormal inherits Bala {

  override method consumirMunicion() {

    // La bala normal tiene municion infinita, no se consume.

  }

  override method tieneMunicion() {

    return true

  }

}
