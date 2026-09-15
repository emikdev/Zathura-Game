import enemigo.*

// Definicion de la subclase Pulpo
class Pulpo inherits Enemigo(position = game.at(2, 10) /* Sobre escritura de atributos heredados */) {

	override method frames() = ["enemigos/pulpo/pulpo-frame1.png", "enemigos/pulpo/pulpo-frame2.png"] // Definicion de los frames de la clase Pulpo

}