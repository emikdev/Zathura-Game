import wollok.game.*

	// Objeto que define posiciones aleatorias
object randomizer {

		// Devuelve una posicion alazar
		
	method position() {

			// Retorna cualquier celda entre (0, 0) y (ancho -1, alto -1)

		return 	game.at( 

					(0 .. game.width() - 1 ).anyOne(),
					(0 ..  game.height() - 1).anyOne()

		) 

	}

	// Devuelve una celda vacial alazar
	
	method emptyPosition() {

		const position = self.position()

		if(game.getObjectsIn(position).isEmpty()) {

			return position	
			
		} else {

			return self.emptyPosition()

		}

	}
	
}