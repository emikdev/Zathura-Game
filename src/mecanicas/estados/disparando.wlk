import src.mecanicas.estados.estado.*
import src.mecanicas.estados.neutral.*
object disparando inherits Estado {

  override method frames(nave) = nave.framesDisparo() //trae los frames del estado disparando para poder correr su animacion, los trae del atributo de la nave
  override method alTerminar(nave) { nave.cambiarEstado(neutral) }
}