import enemigo.*

// Definicion de la subclase Calamar
class Calamar inherits Enemigo(position = game.at(4, 10) /* Sobre escritura de atributos heredados */) {

	override method frames() = ["enemigos/calamar/calamar-frame1.png", "enemigos/calamar/calamar-frame2.png"] // Definicion de los frames de la clase Calamar

}