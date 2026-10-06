import src.personajes.enemigos.enemigo.*

// Factory encargada de crear y configurar enemigos
object fabricaEnemigos {

  method crear(tipo, position) {

    return new Enemigo(

      position = position,

      hp = tipo.hp(),

      framesBase = tipo.framesBase(),

      framesMuerte = tipo.framesMuerte(),

      comportamientoAtaque =
        tipo.comportamientoAtaque()

    )

  }

}