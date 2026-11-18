/* El personaje se inmola. Es un object porque no tiene estado: todos pueden compartirlo. */

object inmolacion {

  method hayAccion(){
    return true
  }

  method decidir(){
    return self
  }

  method actuar(personaje) {
    personaje.inmolarse()
  }

}