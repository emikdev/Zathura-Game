import wollok.game.*

// Definicion de la Superclase abstracta "Enemigo"
class Enemigo {

	var property position // Atributo correspondiente a la posicion del objeto (Getter y Setter autodefinido)
	var frameActual = 0 // Atributo correspondiente al frame actual que debe mostrarse

	method frames() // Metodo abstracto, es decir, cada subclase define sus imágenes

    // Getter que retorna la imagen correspondiente

	method image(){
        
        return self.frames().get(frameActual) 
        
    }

    // Setter que permite interpolar los frames de la animacion (No es un metodo abstracto ya que todas las sub-clases van a usarlo tal cual)

	method animar() {

		frameActual = (frameActual + 1) % self.frames().size() /* Se toma el nuemro de frame actual, se le suma 1 y se lo divide por el tamano de la lista, 
                                                    asegurandose de que no se salga de rango y pueda haber enemigos con distinta cantidad de frames de animacion */

	}

}

// Definicion de la subclase Pulpo
class Pulpo inherits Enemigo(position = game.at(2, 10) /* Sobre escritura de atributos heredados */) {

	override method frames() = ["enemigos/pulpo/pulpo-frame1.png", "enemigos/pulpo/pulpo-frame2.png"] // Definicion de los frames de la clase Pulpo

}

// Definicion de la subclase Calamar
class Calamar inherits Enemigo(position = game.at(4, 10) /* Sobre escritura de atributos heredados */) {

	override method frames() = ["enemigos/calamar/calamar-frame1.png", "enemigos/calamar/calamar-frame2.png"] // Definicion de los frames de la clase Calamar

}

// Definicion de la subclase Alien
class Alien inherits Enemigo(position = game.at(6, 10) /* Sobre escritura de atributos heredados */) {

	override method frames() = ["enemigos/alien/alien-frame1.png", "enemigos/alien/alien-frame2.png"] // Definicion de los frames de la clase Alien

}

/*

	const calamar = new Calamar()
	const pulpo = new Pulpo()
	const alien = new Alien()

	game.addVisual(calamar)
	game.addVisual(pulpo)
	game.addVisual(alien)
	game.onTick(1000, "animarEnemigo", { calamar.animar() })
	game.onTick(1000, "animarEnemigo", { pulpo.animar() })
	game.onTick(1000, "animarEnemigo", { alien.animar() })

*/