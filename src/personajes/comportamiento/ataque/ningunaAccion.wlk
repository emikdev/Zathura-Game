/* Null object: representa "no hacer nada este tick".
 Permite que decidir() siempre devuelva una acción, sin null ni booleanos. */
object ningunaAccion {

  method hayAccion(){
    return false
  }

  method decidir(){
    return self
  }

  method actuar(personaje){ }

}