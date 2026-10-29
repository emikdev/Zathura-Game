import src.personajes.factory.comportamiento.ataque.ningunaAccion.*

/* Envuelve cualquier acción (disparo, inmolacion, Alternativas, otra ConProbabilidad, etc)
   y la elige solo si sale la probabilidad, expresada como porcentaje de 0 a 100. */
class ConProbabilidad {

  const probabilidad
  const accion

  // Tira el dado UNA vez y devuelve qué hay que hacer.
  method decidir(){
    return if (self.ocurre()) accion.decidir() else ningunaAccion
  }

  // Ejecuta lo decidido.
  method actuar(personaje) {
    self.decidir().actuar(personaje)
  }

  method ocurre(){
    return  0.randomUpTo(100) < probabilidad
  }

}