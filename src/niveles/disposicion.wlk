import wollok.game.*
import src.mecanicas.direcciones.*

// Una fila de enemigos: sabe cómo colocarse, centrada en el tablero, a la altura que le indiquen
class FilaDeEnemigos {

    const tipos                // tipos de enemigo, de izquierda a derecha
    const separacion = 1       // distancia entre enemigos contiguos: 1 = juntos, 2 = una celda libre entre cada uno

    // Pares [tipo, posicion] de la fila en la altura y indicada
    method celdasEn(y) {
        const ancho = (tipos.size() - 1) * separacion + 1   // celdas que ocupa la fila
        const desdeX = (game.width() - ancho).div(2)        // margen a cada lado
        const resultado = []
        tipos.size().times({ n =>
            resultado.add([tipos.get(n - 1), game.at(desdeX + (n - 1) * separacion, y)])
        })
        return resultado
    }

}

// Ayudas para escribir filas sin repetir el tipo a mano (la cantidad tiene que ser 1 o más)
object fila {

    // fila.de(pulpo, 3)        -> 3 pulpos juntos
    method de(tipo, cantidad) = new FilaDeEnemigos(tipos = self.repetir(tipo, cantidad))

    // fila.separada(pulpo, 3)  -> 3 pulpos con una celda libre entre cada uno
    method separada(tipo, cantidad) = new FilaDeEnemigos(tipos = self.repetir(tipo, cantidad), separacion = 2)

    // fila.mezcla([pulpo, alien]) -> enemigos de distintos tipos, juntos
    method mezcla(tipos) = new FilaDeEnemigos(tipos = tipos)

    method repetir(tipo, cantidad) = (1..cantidad).map({ i => tipo })

}

// Diseño de una formación: cómo se disponen los enemigos y a qué velocidad se mueve el grupo.
// Es solo el plano; el nivel crea la Formacion real (con sus enemigos) cuando le toca.
class Disposicion {

    const intervalo = 800   // ms entre pasos de la formación: cuanto menor, más rápida
    const filas             // de arriba hacia abajo; cada una es una FilaDeEnemigos

    method intervalo() = intervalo

    // Pares [tipo, posicion]: las filas se apilan hacia abajo desde la de más arriba.
    // Se calcula cuando se pide, con el tamaño real del tablero.
    method celdas() {
        const resultado = []
        filas.size().times({ n =>
            // MODIFICADO ACÁ: Restamos 1 a filaMaxima() para que spawneen un poco más abajo
            resultado.addAll(filas.get(n - 1).celdasEn(tablero.filaMaxima() - 1 - (n - 1)))
        })
        return resultado
    }

}