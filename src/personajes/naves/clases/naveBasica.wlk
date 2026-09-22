import nave.*

// Creacion de una instancia de la clase Nave
const naveBasica = new Nave(

    // Inicializacion de los atributos heredados de la clase
	position = game.origin(),
	vidas = 3, // Cantidad de vidas de la nave
	framesBase = ["naves/nave.png"], // Lista de frames base
	framesDisparo = ["naves/nave-disparo1.png", "naves/nave-disparo2.png"], // lista de frames de disparo
	framesMuerte = ["naves/naveMuerte.png"], // Lista de frames de muerte
	balas = ["bala1", "bala2"], // Lista de balas (tiene 2 string setteados para pruebas)
	balaActual = 0 // Slot en el que inicia la lista de balas

)