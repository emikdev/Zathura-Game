import wollok.game.*
object mover{

    // Getter que valida que la posicion dada este dentro del tablero
    method validarDentro(position) {

        if (not self.dentro(position) /* Si 'self.dentro(position) es true no entra ya que esta negado' */ ) {

            self.error(position.toString() + " no está dentro del tablero ") // Mensaje de error que corta la ejecucion del bloque donde fue llamado

        }

    }

    // Getter que valida que la posicion dad este dentro del tablero
    method dentro(position) {

        return position.x().between(0, game.width() -1) and position.y().between(0, game.height() -1 ) // Valida que la posicion este en coordenadas validas

    }

    method moverSiSePuede(position) {
        const nueva = position // Guarda la posicion de la celda a la qe se desea moverse.
        self.validarDentro(nueva) // Valida que la celda a la que se desea moverse este dentro del tablero, si da error corta ejecucion del bloque.
        return nueva // Retorna la nueva posicion a la que se desea moverse.
    }
}