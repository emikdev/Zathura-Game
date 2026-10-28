import src.mecanicas.disparo.*
import src.mecanicas.animaciones.animacion.*

class Arma {

    const recursoBala // recurso con frames y duracion de la bala
    const danoBala = 10
    var municion

  method disparar(personaje) {

        if (self.hayMunicion() and personaje.bando().puedeDisparar()) {

            const nuevoDisparo = new Disparo(
                recursoDeAnimacion = recursoBala,
                dano = danoBala,
                bando = personaje.bando(),
                position = personaje.position()
            )
      
      nuevoDisparo.iniciar()
      personaje.bando().registrar(nuevoDisparo)
      self.consumirMunicion()
      if (not self.hayMunicion()) personaje.descartarArma(self)

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