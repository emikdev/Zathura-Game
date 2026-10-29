// Define el comportamiento común de todos los ataques
class ComportamientoAtaque {

  // Cada comportamiento debe decidir qué hacer
  method actuar(enemigo)

  // Devuelve true cuando se cumple una probabilidad expresada como porcentaje entre 0 y 100.
  method ocurre(probabilidad) {

    return (0..99).anyOne() < probabilidad

  }

}