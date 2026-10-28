import src.mecanicas.disparo.*
import src.mecanicas.animaciones.animacion.*

class Arma {
  const recursoBala // recurso de animacion de disparo
  const property dano        // daño del arma que dispara

  method disparar(personaje) {
    if (self.hayMunicion() and personaje.bando().puedeDisparar()) {
      const nuevoDisparo = new Disparo(
        recursoDeAnimacion = recursoBala,
        dano = dano,
        bando = personaje.bando(),
        position = personaje.position()
      )
      
      nuevoDisparo.iniciar()
      personaje.bando().registrar(nuevoDisparo)
      self.consumirMunicion()
    }
  }

  method hayMunicion() = true
  method consumirMunicion() {}
  method recargar(cantidad) {}
}
