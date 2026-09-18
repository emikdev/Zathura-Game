import src.mecanicas.direcciones.*

class Bala {
  // El UML pide estos atributos de Bala:
  var property listaFrames = [] 
  var property velocidad = 1000
  var property daño = 100

  method frames() = listaFrames
  
  // Si querés que cada subclase configure su velocidad por método, la dejamos acá:
  method velocidad() = velocidad
}