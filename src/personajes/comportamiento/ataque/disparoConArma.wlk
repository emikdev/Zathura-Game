/* El personaje equipa el arma del slot indicado y dispara.
 Necesaria cuando un comportamiento alterna entre armas (por ejemplo, normal y pesada):
 el arma equipada persiste, así que cada disparo debe elegir la suya. */
class DisparoConArma {

  const slot

  method hayAccion(){
    return true
  }

  method decidir(){
    return self
  }

  method actuar(personaje) {
    personaje.seleccionarArma(slot)
    personaje.disparar()
  }

}