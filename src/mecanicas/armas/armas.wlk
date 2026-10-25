import src.mecanicas.disparo.*
import wollok.game.*
import src.mecanicas.animador.*

// classe base de Armas
class Arma {
  const property framesBala = ["disparoCeleste-frame1.png", "disparoCeleste-frame2.png", "disparoCeleste-frame3.png"]
  const property danoBala = 10
  const property velocidadBala = 5

  method disparar(personaje) {
    if (self.hayMunicion() and personaje.bando().puedeDisparar()) {
      const animacionBala = new Animador(frames = framesBala)

      const nuevoDisparo = new Disparo(
          animacion = animacionBala,
          dano = danoBala,
          velocidad = velocidadBala,
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
}

