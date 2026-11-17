import src.personajes.factory.factory.*
import src.mecanicas.direcciones.*
import wollok.game.*

object configuracion {

  var property dificultadElegida = 1
  var property cantidadJugadores = 1
  const property tiposNaves = []

  // Tope máximo de 3 para evitar que 2 jugadores + Hardcore sature los ticks del motor
  method dificultad() {
    return (dificultadElegida + cantidadJugadores - 1).min(3)
  }

  method naves() {
    const resultado = []
    tiposNaves.size().times({ n =>
      const i = n - 1
      const posX = if (i == 0) 2 else game.width() - 3
      resultado.add(factory.crearNave(tiposNaves.get(i), game.at(posX, tablero.filaMinima())))
    })
    return resultado
  }

}
