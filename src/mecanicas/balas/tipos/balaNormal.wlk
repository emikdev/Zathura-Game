import src.mecanicas.balas.bala.*

// Como es la unica bala que no consume municion, es decir su comportamiento es distinto, se va a hacer de esta manera.
// instanciando un objeto que hereda de la Clase Bala los atributos y sus metodos.
const balaNormal = object inherits Bala ( frames=[disparo-frame1.png, disparo-frame2.png, disparo-frame3.png],velocidad=10, dano= 50, municion = 5){  
    
    override method consumirMunicion(){ 

        municion = municion - 0

  }
}