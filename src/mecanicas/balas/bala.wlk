// Declaracion de la clase bala
class Bala {

  const frames // Lista de frames de la animacion 
  const velocidad // Velocidad en la que se ejecuta la lista de frames
  const dano // Dano que ocaciona el proyectil
  const municion // Cantidad de municion que hay de dicha bala

  // Getter que entrega la lista de frames correspondiente a la bala

  method frames(){

    return frames

  }

  // Getter que entrega la velocidad correspondiente a la bala

  method  velocidad(){

    return velocidad

  }

  // Getter que entrega el dano correspondiente a la bala

  method dano(){

    return dano

  }

  // Getter que entrega la muncion correspondiente a la bala
  
  method municion(){

    return municion

  }

  // Metodo que permite consumir la municion cuando la bala es disparada
  method consumirMunicion(){

    municion - 1

  }

}