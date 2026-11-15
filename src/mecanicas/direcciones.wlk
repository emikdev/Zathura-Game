import wollok.game.*

// Zona jugable del tablero. El contorno (primera y última fila y columna)
// queda reservado para el HUD: ni personajes ni disparos pueden entrar ahí.
object tablero {

    const margen = 1

    method columnaMinima() = margen
    method columnaMaxima() = game.width() - 1 - margen
    method filaMinima() = margen
    method filaMaxima() = game.height() - 1 - margen

    method dentro(position) {
        return position.x().between(self.columnaMinima(), self.columnaMaxima())
           and position.y().between(self.filaMinima(), self.filaMaxima())
    }

    // Resguardo: corta la ejecución si se fuerza una posición fuera de la zona jugable
    method validarDentro(position) {
        if (not self.dentro(position)) {
            self.error(position.toString() + " está fuera de la zona jugable")
        }
    }
}

// Clase base para unificar el comportamiento de todas las direcciones
class Direccion {

    // Cada dirección calcula su celda vecina a distancia 1
    method calcularSiguiente(position)

    method opuesta()

    // Consulta segura: no rompe ni exige try-catch
    method puedeAvanzar(position) {
        return tablero.dentro(self.calcularSiguiente(position))
    }

    // Solo usar si puedeAvanzar(): si el destino cae fuera de la zona jugable, corta con error
    method siguiente(position) {
        const destino = self.calcularSiguiente(position)
        tablero.validarDentro(destino)
        return destino
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