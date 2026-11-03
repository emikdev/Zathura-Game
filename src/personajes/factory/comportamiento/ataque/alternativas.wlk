import src.personajes.factory.comportamiento.ataque.ningunaAccion.*

/* Evalúa las opciones en orden y elige la primera que decida hacer algo.
 Si ninguna lo hace, elige ningunaAccion. */
class Alternativas {

  const opciones

  /* Evalúa todas las opciones, pero como los dados son independientes
   la probabilidad de cada resultado es la misma que si cortara en la primera. */
  method decidir() {
    return opciones.map({ opcion => opcion.decidir() }).findOrDefault({ decision => decision.hayAccion() }, ningunaAccion)
  }

  // Ejecuta lo decidido.
  method actuar(personaje) {
    self.decidir().actuar(personaje)
  }

}