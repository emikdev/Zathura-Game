import nave.*
import src.mecanicas.balas.bala.*

// Creacion de una instancia de la clase Nave
const naveBasica = new Nave(

    // Inicializacion de los atributos heredados de la clase
	position = game.origin(),
	vidas = 3, // Cantidad de vidas de la nave
	framesBase = ["naves/naveBasica/nave.png"], // Lista de frames base
	framesDisparo = ["naves/naveBasica/naveDisparando-frame1.png", "naves/naveBasica/naveDisparando-frame2.png"], // lista de frames de disparo
	framesMuerte = ["naves/naveMuerte.png"], // Lista de frames de muerte
	balas = [new Bala(
		frames = ["recursos/disparos/disparoNave/disparo-frame1.png", "recursos/disparos/disparoNave/disparo-frame2.png", "recursos/disparos/disparoNave/disparo-frame3.png"],
		velocidad = 200,
		dano = 1,
		municion = 10
	)], // Lista de balas (tiene 2 string setteados para pruebas)
	balaActual = 0 // Slot en el que inicia la lista de balas

)