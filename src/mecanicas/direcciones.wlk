import wollok.game.*

// Objeto representativo del tablero de Wollok-Game
object tablero {
    method validarDentro(position) {
        if (not self.dentro(position)) {
            // Este self.error corta la ejecución drásticamente si se fuerza una posición inválida
            self.error(position.toString() + " no está dentro del tablero ")
        }
    }

    method dentro(position) {
        return position.x().between(0, game.width() - 1) 
           and position.y().between(0, game.height() - 1)
    }
}

// Clase base para unificar el comportamiento de todas las direcciones
class Direccion {
    // Método abstracto: cada dirección calcula su celda vecina a distancia 1
    method calcularSiguiente(position)

    /*
       Antes, llamar a siguiente() obligaba a usar un bloque 'try-catch' afuera porque explotaba con self.error().
       Ahora, el método primero valida defensivamente con 'puedeAvanzar()'. Si el camino es seguro, avanza;
       si se intenta forzar un movimiento fuera de los límites, recién ahí dispara el error de resguardo.
    */
    method siguiente(position) {
        if (self.puedeAvanzar(position)) {
            return self.calcularSiguiente(position)
        } else {
            // Resguardo de seguridad: si se invoca incorrectamente, corta la ejecución
            tablero.validarDentro(self.calcularSiguiente(position))
            return position
        }
    }

    // Método seguro que devuelve un Booleano (true/false) sin romper el programa ni exigir try-catch
    method puedeAvanzar(position) {
        return tablero.dentro(self.calcularSiguiente(position))
    }
    
    method opuesta()
}

// Objetos representativos de las direcciones heredando de la base
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
