import src.mecanicas.balas.bala.*

class BalaDoble inherits Bala {
  // Inicializamos la lista de frames directo en el constructor de la subclase
  override method frames() = ["naves/balaDoble-frame1.png", "naves/balaDoble-frame2.png"] 

  override method velocidad() = 5
  
  // Definimos el daño que causa este tipo de bala si es necesario
  override method dano() = 100 
}
