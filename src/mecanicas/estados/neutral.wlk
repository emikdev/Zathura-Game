import src.mecanicas.estados.estado.*


object neutral inherits Estado {

  	override method frames(nave) = nave.framesBase() // trae los frames del estado neutral para poder correr su animacion, los trae del atributo de la nave
	override method puedeDisparar() = true
}