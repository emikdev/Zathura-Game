import enemigo.*

// Definicion de la subclase Alien
class Alien inherits Enemigo(position = game.at(6, 10) /* Sobre escritura de atributos heredados */) {

	override method frames() = ["enemigos/alien/alien-frame1.png", "enemigos/alien/alien-frame2.png"] // Definicion de los frames de la clase Alien

}