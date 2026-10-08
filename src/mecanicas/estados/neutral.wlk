import naves.nave.*
import mecanicas.disparo.*
import src.mecanicas.balas.bala.*
object neutral {
  
    const frames = ["nave.png"]

    method animar() {
        
        return frames
    }
        // Corre la animacion de disparo de la nave
	method disparar(){

		if(estado == "neutral"){ // Se chequea que la nave este en el estado neutral

			// Se intancia el disparo
			const nuevoDisparo = new Disparo( 

				frames = self.balaActual().frames(),
				dano = self.balaActual().dano(),
				velocidad = self.balaActual().velocidad(),
				position = self.position().up(1),
				direccion = arriba,
				bando = bando

			)

			// Se inicia el disparo
			nuevoDisparo.iniciar()

			// Se consume la municion de la bala actual
			self.balaActual().consumirMunicion()

			// Se verifica si todavia hay municion de la bala actual, sino la elimina y se carga la bala basica
			self.hayMunicion()

		}
	}
}