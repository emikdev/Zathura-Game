import wollok.game.*

// Zona jugable del tablero. La primera y la última fila quedan reservadas para el HUD:
// ni personajes ni disparos pueden entrar ahí. Las columnas son todas jugables.
object tablero {

    const filasDeHud = 1 // Cantidad de filas que ocupa el HUD/Score

    method columnaMinima() = 0
    method columnaMaxima() = game.width() - 1
    method filaMinima() = filasDeHud
    method filaMaxima() = game.height() - 1 - filasDeHud

    method dentro(position) {
        return position.x().between(self.columnaMinima(), self.columnaMaxima())
           and position.y().between(self.filaMinima(), self.filaMaxima())
    }
}

// Clase base para unificar el comportamiento de todas las direcciones
class Direccion {

    // Cada dirección calcula su celda vecina a distancia 1
    method calcularSiguiente(position)

    method opuesta()

    // Consulta: ¿existe la celda vecina dentro de la zona jugable?
    method puedeAvanzar(position) {
        return tablero.dentro(self.calcularSiguiente(position))
    }

    /* Si la celda vecina no existe, la posición no cambia (sin errores):
    quien se mueve no necesita preguntar antes si puede */
    method siguiente(position) {
        if (self.puedeAvanzar(position)) {
            return self.calcularSiguiente(position)
        } else {
            return position
        }
    }
}

object arriba inherits Direccion {
    override method calcularSiguiente(position) = position.up(1)
    override method opuesta() = abajo
}

object abajo inherits Direccion {
    override method calcularSiguiente(position) = position.down(1)
    override method opuesta() = arriba
}

object derecha inherits Direccion {
    override method calcularSiguiente(position) = position.right(1)
    override method opuesta() = izquierda
}

object izquierda inherits Direccion {
    override method calcularSiguiente(position) = position.left(1)
    override method opuesta() = derecha
}