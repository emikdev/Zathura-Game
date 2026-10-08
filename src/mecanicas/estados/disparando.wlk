import naves.nave.*
import mecanicas.disparo.*
object disparando {


    var frameActual = 1
    const framesDisparo = [ "naveDisparando-frame1.png","naveDisparando-frame2.png" ]

    	// Anima el disparo hasta que llega al final de la lista frameDisparo, cuando termina settea disparando = false
	method animar(){

		if ( frameActual < framesDisparo.size() - 1 )/* Si aun hay frames en la lista y si sigue disparando*/{ 

			game.schedule(100, {

				frameActual += 1 // Pasa al siguiente frame de la animacion
				self.animar() // Se llama nuevamente a si misma para seguir con la animacion
                
            })

		} else {

			game.schedule(100, {

				frameActual = 0 // Vuelve al primer frame 

			})

		}

	}
}