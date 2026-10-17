import src.mecanicas.disparo.*
import wollok.game.*
import src.mecanicas.animador.*

class Arma {
  // Configuración por defecto de la munición base
  const property framesBala = ["disparoCeleste-frame1.png", "disparoCeleste-frame2.png", "disparoCeleste-frame3.png"]
  const property danoBala = 10
  const property velocidadBala = 5

  method disparar(personaje) {
    // Valida tanto la munición propia como las reglas de límites del bando
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
      
      // Se ejecuta el consumo (por defecto en esta clase base no hace nada)
      self.consumirMunicion()
    }
  }

  // POLIMORFISMO: Por defecto el arma base SIEMPRE tiene munición
  method hayMunicion() = true

  // POLIMORFISMO: Por defecto el arma base NO consume nada al disparar
  method consumirMunicion() {
    // Método vacío intencionalmente para las armas infinitas
  }
}
