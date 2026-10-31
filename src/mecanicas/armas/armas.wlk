import src.mecanicas.disparo.*
import src.mecanicas.animaciones.animacion.*

class Arma {

    const recursoBala // recurso con frames y duracion de la bala
    const danoBala = 10 // daño base de la bala
    var municion
    const  animacion = new Animacion(estado = self, recursoDeAnimacion = recursoBala)

  method danoDisparo() { // metodo que describe el daño de la bala (para que despues las armas que consumen más municion agan mas daño)
      return danoBala
  }

  method disparar(personaje) {

        if (personaje.bando().puedeDisparar()) {

            const nuevoDisparo = new Disparo(
                animacion = animacion,
                dano = self.danoDisparo(),
                bando = personaje.bando(),
                position = personaje.position()
            )
      
      nuevoDisparo.iniciar()
      personaje.bando().registrar(nuevoDisparo)
      self.consumirMunicion()
    }

  }

  // POLIMORFISMO: Por defecto el arma base SIEMPRE tiene munición
  method hayMunicion(){
    return municion > 0
  }

  method consumirMunicion(){
    municion -= 1
  }
  
}