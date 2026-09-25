import wollok.game.*
import src.mecanicas.direcciones.*
import src.mecanicas.disparo.*
import src.mecanicas.balas.bala

// Se define la clase nave
class Nave {

	var property position
	var vidas

    // Listas de frames correspondientes a los estados de la nave
	const framesBase 
	const framesDisparo 
	const framesMuerte 

    // Indice de la lista de frames
	var frameActual = 0

    // Flag de estado para evitar superposicion de acciones
	var estado = "neutral"
	
	
	/* 
		IMPORTANTE: La primera posicion de la lista siempre tiene que contener 
		la bala basica es decir la que tiene municion infinita
	*/
	var balas // Lista de balas que tiene la nave
	var balaActual // Bala que la nave tiene seleccionada de la lista

	const bando = "jugador"


    // Getter que entrega la cantidad de vidas que tiene la nave
	method vidas(){ 
        
        return vidas 
        
    }

    // Getter que entrega la imagen de la nave
	method image(){

		if (estado == "muerta") return framesMuerte.get(frameActual) // Retorna los frames correspondientes a la muerte de la nave cuando se queda sin vidas. 
		if (estado == "disparando") return framesDisparo.get(frameActual) // Retorna los frames correspondientes a la nave disparando. 
		return framesBase.get(0) // Retorna los frames base de la nave

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

				estado = "neutral" // Cambia al estado neutral
				frameActual = 0 // Vuelve al primer frame 

			})

		}

	}


	// Animacion de muerte, settea muerta = true
	method morir() {

		estado == "muerta" // Actualiza el flag de la nave
		frameActual = 0 // Setea el frame actual al comienzo de la lista de frames
		self.animarMuerte() // Pasa al siguiente frame de la animacion de muerte

	}

	// Corre la animacion de la muerte hasta llegar al final de la lista ordenada framesMuerte
	method animarMuerte() {

		if (frameActual < framesMuerte.size() - 1)/* Si aun hay frames en la lista */{

			game.schedule(150, {

				frameActual += 1 // Pasa al siguiente frame de la lista
				self.animarMuerte() // Se llama nuevamente a si misma para seguir con la animacion

			})

		}

	}

	// Disparador que quita una vida y activa animacion de muerte
	method recibirDano() {

		if (not estado == "muerta")/* Si la nave no esta muerta */{

			vidas -= 1 // Se le resta una vida a la nave

			if (vidas <= 0) /* Si la nave aun tiene vidas */{

				self.morir() // Se ejercuta la animacion de muerte de la nave.

			}

		}

	}

    // Setter de la bala, cambia la bala que esta cargada lista para disparar
	method cambiarDeBalaA(slot){	

		if(slot <= balas.size()-1){ // Verifica que el slot dado exista
			balaActual = slot - 1
		}
	
	}

	// Setter que avanza al siguiente slot del arsenal de balas
	method siguienteBala(){

		// Aumenta en 1 el slotBalaActual, si llega al final de la lista vuelve a la posicion 0
		balaActual = (balaActual + 1) % balas.size()
	}

	// Getter que devuelve la bala actual cargada 
	method balaActual(){

		return balas.get(balaActual)	// Devuelve la bala actual a partir del indice en tiposDeBalas
	
	}

	// Verifica si la balaActual tiene municion, si no la tiene se elimina de la lista de balas
	// y mueve el indice a la bala basica (0)
	method hayMunicion(){
		
		if(self.balaActual().municion() <= 0){ // Verifica si no tiene municion la bala actual
			
			balas.remove(balas.get(balaActual)) // Remueve la bala actual de la lista
			balaActual = 0 // Mueve el indice a la bala basica

		}
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

    // Setter de movimiento que permite desplazar la nave
    method mover(direccion){

        if(estado != "muerta")/* Si no esta muerta */{

            const nuevaPosition = direccion.siguiente(position) // Guarda la siguioente posicion
            position = nuevaPosition // Mueve la nave a la siguiente posicion

        }

	}

    // Metodo que permite iniciar el ciclo de vida de la nave
    method iniciar() {

    game.addVisual(self)

    // Movimiento hacia la izquierda
    keyboard.a().onPressDo {

      self.mover(izquierda)

    }

    // Movimiento hacia la derecha
    keyboard.d().onPressDo {

      self.mover(derecha)

    }

    // Disparo
    keyboard.space().onPressDo {

      self.disparar()

    }

    // Cambiar a la siguiente bala
    keyboard.q().onPressDo {

      self.siguienteBala()

    }

    // Selección directa de balas
    keyboard.num(1).onPressDo {

      self.cambiarDeBalaA(1)

    }

    keyboard.num(2).onPressDo {

      self.cambiarDeBalaA(2)

    }

    keyboard.num(3).onPressDo {

      self.cambiarDeBalaA(3)

    }

    keyboard.num(4).onPressDo {

      self.cambiarDeBalaA(4)

    }

    keyboard.num(5).onPressDo {

      self.cambiarDeBalaA(5)

    }

    keyboard.num(6).onPressDo {

      self.cambiarDeBalaA(6)

    }

    keyboard.num(7).onPressDo {

      self.cambiarDeBalaA(7)

    }

    keyboard.num(8).onPressDo {

      self.cambiarDeBalaA(8)

    }

    keyboard.num(9).onPressDo {

      self.cambiarDeBalaA(9)

    }

  }

}