import src.mecanicas.disparo.*
import wollok.game.*
import src.mecanicas.animador.*     // Tu clase Animador

class Arma {
  // Configuración base de la munición que dispara esta arma
  const property framesBala = ["disparoCeleste-frame1.png", "disparoCeleste-frame2.png", "disparoCeleste-frame3.png"]    // Lista de imágenes para el proyectil (ej: ["bullet1.png", "bullet2.png"])
  const property danoBala = 10
  const property velocidadBala = 5
  const municion = 100 // Cantidad de munición disponible para esta arma 

  // Acciones del arma
  method disparar(personaje) {
        // Creamos un animador exclusivo para esta nueva bala
        const animacionBala = new Animador(frames = framesBala)

        // Instanciamos el disparo delegándole sus responsabilidades básicas
        const nuevoDisparo = new Disparo(
            animacion = animacionBala,
            dano = danoBala,
            velocidad = velocidadBala,
            bando = personaje.bando(), // El arma le pregunta el bando a la nave
            position = personaje.position() // Sale desde la posición actual de la nave
        )
        // Le damos vida al proyectil
        nuevoDisparo.iniciar()

        // Delegación: El arma le pide al bando del personaje que gestione el límite global
        personaje.bando().registrar(nuevoDisparo)
    }

    method hayMunicion() {
      // Aquí se implementar la  para verificar si hay munición disponible
      return municion > 0  // Por ahora, asumimos que siempre hay munición
    }

    method consumirMunicion() {
      // Aquí se implementar la lógica para consumir munición
    }
}

// al disparar el arma crea un nuevo Disparo, que a su vez crea un Animador exclusivo para ese proyectil. Esto permite que cada bala tenga su propia animación independiente.

// si queremos agregar más armas, podemos crear subclases de Arma con diferentes configuraciones de frames, daño y velocidad. y overridear el método consumirMunicion() y hayMunicion() si queremos un comportamiento especial.