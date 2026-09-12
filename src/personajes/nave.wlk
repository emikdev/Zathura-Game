import wollok.game.*

// Se define la clase nave
class Nave {

	var property position // Se define la posicion del objeto junto con sus Setter y Getter
	var vidas // Cantidad de vidas que tiene la nave

	const framesBase // Lista de frames base que debe ser definida por el objeto
	const framesDisparo // Lista de frames de disparo que debe ser definida por el objeto
	const framesMuerte // Lista de frames de muerte que debe ser definida por el objeto

	var frameActual = 0 // Indice de qué imagen de la lista corresponde mostrar en este momento
	var disparando = false // Flag que le dice a image() que lista de frames usar
	var muerta = false // Flag que le dice a image() que lista de frames usar


    // Getter que entrega la cantidad de vidas que tiene la nave
	method vidas(){ 
        
        return vidas 
        
    }

    // Setter de movimiento que mermite desplazar la nave
    method mover(direccion){
        if(not muerta)/* Si no esta muerta */{
            const nuevaPosition = direccion.siguiente(position) // Guarda la siguioente posicion
            position = nuevaPosition // Mueve la nave a la siguiente posicion
        }
	}

    // Getter que entrega la imagen de la nave
	method image(){

		if (muerta) return framesMuerte.get(frameActual) // Retorna los frames correspondientes a la muerte de la nave cuando se queda sin vidas. 
		if (disparando) return framesDisparo.get(frameActual) // Retorna los frames correspondientes a la nave disparando. 
		return framesBase.get(0) // Retorna los frames base de la nave

	}

	// Corre la animacion de disparo de la nave
	method disparar(){

		if (not muerta and not disparando)/* Si la nave no dispara y esta viva */{ 

			disparando = true // Actualiza el flag de la nave
			frameActual = 0 // Setea el frame actual al comienzo de la lista de frames
			self.animarDisparo() // Ejecuta la animacion de disparo de la nave

		}

	}

	// Anima el disparo hasta que llega al final de la lista frameDisparo, cuando termina settea disparando = false
	method animarDisparo(){

		if (frameActual < framesDisparo.size() - 1)/* Si aun hay frames en la lista */{ 

			game.schedule(100, {

				frameActual += 1 // Pasa al siguiente frame de la animacion
				self.animarDisparo() // Se llama nuevamente a si misma para seguir con la animacion
                
            })

		} else {

			game.schedule(100, {

				disparando = false // Corta la animaciond e disparo
				frameActual = 0 // Vuelve al primer frame 

			})

		}

	}

	// Disparador que quita una vida y activa animacion de muerte
	method recibirImpacto() {

		if (not muerta)/* Si la nave no esta muerta */{

			vidas -= 1 // Se le resta una vida a la nave

			if (vidas <= 0) /* Si la nave aun tiene vidas */{

				self.animarMuerte() // Se ejercuta la animacion de muerte de la nave.

			}

		}

	}


	// Animacion de muerte, settea muerta = true
	method animarMuerte() {

		muerta = true // Actualiza el flag de la nave
		frameActual = 0 // Setea el frame actual al comienzo de la lista de frames
		self.siguienteFrameMuerte() // Pasa al siguiente frame de la animacion de muerte

	}

	// Corre la animacion de la muerte hasta llegar al final de la lista ordenada framesMuerte
	method siguienteFrameMuerte() {

		if (frameActual < framesMuerte.size() - 1)/* Si aun hay frames en la lista */{

			game.schedule(150, {

				frameActual += 1 // Pasa al siguiente frame de la lista
				self.siguienteFrameMuerte() // Se llama nuevamente a si misma para seguir con la animacion

			})

		}

	}


}

// Creacion de una instancia de la clase Nave
const naveDefault = new Nave(

    // Inicializacion de los atributos heredados de la clase
	position = game.origin(),
	vidas = 3, // Cantidad de vidas de la nave
	framesBase = ["naves/nave.png"], // Lista de frames base
	framesDisparo = ["naves/nave-disparo1.png", "naves/nave-disparo2.png"], // lista de frames de disparo
	framesMuerte = ["naves/naveMuerte.png"] // Lista de frames de muerte

)