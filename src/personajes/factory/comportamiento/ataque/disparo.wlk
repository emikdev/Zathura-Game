/* El personaje dispara con el arma que tenga equipada.
 No sabe nada de probabilidades ni de armas: el estado del personaje resuelve el resto. */
object disparo {

  method hayAccion(){
    return  true
  }

  method decidir(){
    return self
  }

  method actuar(personaje){
    personaje.disparar()
  }

}