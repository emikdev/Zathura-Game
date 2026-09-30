class Bala {

  // Usamos 'var' para que la munición pueda disminuir al disparar
  var municion = 10000 

  // Métodos abstractos/base que las subclases van a heredar o sobreescribir
  method frames()
  method velocidad()
  method dano()

  // Getter de la munición actual
  method municion(){
    return municion
  }

  method consumirMunicion(){
    municion = municion - 1
  }
}
