import src.mecanicas.estados.estadoPersonaje.*
class Disparando inherits EstadoPersonaje {

    override method disparar(personaje) {
      
        personaje.armaActual().disparar(personaje)

    }

}