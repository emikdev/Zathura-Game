import src.mecanicas.estados.estadoPersonaje.*
import src.mecanicas.estados.disparando.*
import src.mecanicas.estados.impactado.*

class Neutral inherits EstadoPersonaje {

    method initialize(){
        const animacion = personaje.animacionBase()
    }

    override method disparar(){ 
        personaje.cambiarEstado(new Disparando(personaje = personaje))
    }

    override method recibirImpacto(){
        personaje.cambiarEstado(new Impactado(personaje = personaje))
    }

}