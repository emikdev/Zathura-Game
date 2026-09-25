import bala.*

class SuperBala inherits Bala {

    override method frames() = ["naves/superBala-frame1.png", "naves/superBala-frame2.png"] // Definicion de los frames de la clase SuperBala.

    override method velocidad() = 5
  
    // Definimos el daño que causa este tipo de bala si es necesario
    override method dano() = 500 
    
}