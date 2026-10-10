import nave.*
import src.mecanicas.balas.clases.balaNormal.*
import src.mecanicas.balas.bala.*

// Creacion de una instancia de la clase Nave
const naveBasica = new Nave(

    // Inicializacion de los atributos heredados de la clase
	position = game.origin(),
	vidas = 3, // Cantidad de vidas de la nave
	framesBase = ["nave.png"], // Lista de frames base
	framesDisparo = ["naveDisparando-frame1.png", "naveDisparando-frame2.png"], // lista de frames de disparo
	framesMuerte = ["muerteNave-frame1.png", "muerteNave-frame2.png", "muerteNave-frame3.png", "muerteNave-frame4.png", "muerteNave-frame5.png", "muerteNave-frame6.png", "muerteNave-frame7.png"], // Lista de frames de muerte
	balas = [balaNormal], // Lista de balas (tiene 2 string setteados para pruebas)
	balaActual = 0 // Slot en el que inicia la lista de balas

)