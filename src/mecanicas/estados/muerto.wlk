import naves.nave.*
object muerto {

    var frameActual = 0
    const frames= ["muerteNave-frame1.png","muerteNave-frame2.png","muerteNave-frame3.png","muerteNave-frame4.png" , "muerteNave-frame5.png","muerteNave-frame6.png","muerteNave-frame7.png" ]

    method animar() { // mensaje polimorfico, animar el estado.
      
        return frames    // devuelve los frames de la animacion de la muerte.
    }

    	// Animacion de muerte, settea muerta = true
	method morir() {

		frameActual = 0 // Setea el frame actual al comienzo de la lista de frames
		Nave.animarMuerte() // Pasa al siguiente frame de la animacion de muerte

	}
}