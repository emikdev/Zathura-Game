import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.animador.*
import src.mecanicas.gestorDisparos.*

class Disparo {
  // Recibe un objeto de la clase Animador ya configurado
  const property animacion 
  // propiedades del disparo
  const property dano
  const property velocidad
  const property bando

  var property position
  // Ahora le pide la imagen directamente al gestor de animaciones
  method image() = animacion.imagenActual()
  // direccion del disparo 
  const direccion = bando.direccionDisparo()

  method actualizar() {
    // Avanza el frame. Si el animador avisa que terminó el ciclo (true), avanza de celda
    const terminoCiclo = animacion.avanzarFrame()
    if (terminoCiclo) {
      self.avanzar()
    }
  }

  method iniciar() {
    game.addVisual(self)
    // cambie el onCollideDo por el nativo onCollide pero no me lo detecta
    game.onCollideDo(self, { objetivo => self.colisionarCon(objetivo) })
    // El cálculo del tiempo usa los frames que tiene guardados el animador
    const duracionFrame = (1000 / velocidad) / animacion.frames().size()
    game.onTick(duracionFrame, self, { self.actualizar() })
  }

  method avanzar() {
    try {
      position = direccion.siguiente(position)
    } catch e : DomainException {
      // Si el disparo sale del área de juego, se destruye a sí mismo
      self.destruir()
    }
  }

  method colisionarCon(objetivo) {
    // Comparamos directamente los objetos o nombres de bando. ¡Casi cero consumo de CPU!
    if (objetivo.bando().nombre() != bando.nombre()) {
      objetivo.recibirDano(dano)
      self.destruir()
    }
  }


  method destruir() {
     // Primero le avisamos al gestor global para liberar el espacio del bando
    gestorDisparos.liberarDisparo(self, bando)
    if (game.hasVisual(self)) { 
      game.removeVisual(self) 
    }

    try { 
      game.removeTickEvent(self) 
    } catch e : Exception { 
      // Evita problemas si el evento ya fue eliminado
    }
  }
}

/* recomiendo directamente crear una classe armas para que tenga un metodo disparar() y ahi cree el disparo y lo inicie, asi si queremos delegar logiaca que no corresponde a disparo pero si a la arma  
como iniciar un disparo:
const animacionBala = new Animador(frames = ["bala1.png", "bala2.png", "bala3.png"])

const disparoNuevo = new Disparo(
    animacion = animacionBala,
    dano = 10,
    velocidad = 5,
    bando = bandoJugador, // o el objeto bando correspondiente
    position = nave.position(),
    direccion = norte
)

disparoNuevo.iniciar()


*/