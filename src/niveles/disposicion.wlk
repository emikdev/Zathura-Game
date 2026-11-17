import wollok.game.*
import src.mecanicas.direcciones.*
import src.menu.configuracion.*

class FilaDeEnemigos {

  const tipos                // tipos de enemigo, de izquierda a derecha
  const separacion = 1       // distancia entre enemigos contiguos: 1 = juntos, 2 = una celda libre entre cada uno

  method celdasEn(y) {
    const ancho = (tipos.size() - 1) * separacion + 1
    const desdeX = (game.width() - ancho).div(2)
    const resultado = []
    tipos.size().times({ n =>
      resultado.add([tipos.get(n - 1), game.at(desdeX + (n - 1) * separacion, y)])
    })
    return resultado
  }

}

object fila {

  method de(tipo, cantidad) = new FilaDeEnemigos(tipos = self.repetir(tipo, cantidad))

  method separada(tipo, cantidad) = new FilaDeEnemigos(tipos = self.repetir(tipo, cantidad), separacion = 2)

  method mezcla(tipos) = new FilaDeEnemigos(tipos = tipos)

  method repetir(tipo, cantidad) = (1..cantidad).map({ i => tipo })

}

class Disposicion {

  const intervaloBase = 800   // ms base entre pasos de la formación
  const filas                 // de arriba hacia abajo; cada una es una FilaDeEnemigos

  // Se calcula dinámicamente al lanzar la oleada para respetar la dificultad elegida en el menú
  method intervalo() = intervaloBase.div(configuracion.dificultad().max(1))

  method celdas() {
    const resultado = []
    filas.size().times({ n =>
      resultado.addAll(filas.get(n - 1).celdasEn(tablero.filaMaxima() - (n - 1)))
    })
    return resultado
  }

}
