// Estos objetos NO son enemigos concretos.
// Representan la configuracion que debe recibir un Enemigo cuando la Factory construye uno.

// Alien's
// Alien normal
object alien {

  method hp() = 1

  method framesBase() {
    return framesAlien
  }

  method framesMuerte() {
    return framesMuerteAlien
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 20,
      bala = balaNormalEnemiga
    )
  }

}

// Alien Heavy: misma conducta, mas HP y otra configuracion de disparo
object alienHeavy {

  method hp() = 3

  method framesBase() {
    return framesAlienHeavy
  }

  method framesMuerte() {
    return framesMuerteAlienHeavy
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaPesadaEnemiga
    )
  }

}


// Alien Azul: mismos stats y comportamiento que el Alien normal
object alienAzul {

  method hp() = 1

  method framesBase() {
    return framesAlienAzul
  }

  method framesMuerte() {
    return framesMuerteAlienAzul
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaNormalEnemiga
    )
  }

}


// Calamares
// Calamar normal
object calamar {

  method hp() = 1

  method framesBase() {
    return framesCalamar
  }

  method framesMuerte() {
    return framesMuerteCalamar
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 25,
      bala = balaNormalEnemiga
    )
  }

}

// Calamar Heavy
object calamarHeavy {

  method hp() = 3

  method framesBase() {
    return framesCalamarHeavy
  }

  method framesMuerte() {
    return framesMuerteCalamarHeavy
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaPesadaEnemiga
    )
  }

}

// Calamar Amarillo
object calamarAmarillo {

  method hp() = 1

  method framesBase() {
    return framesCalamarAmarillo
  }

  method framesMuerte() {
    return framesMuerteCalamarAmarillo
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaNormalEnemiga
    )
  }

}


// Pulpos
// Pulpo normal
object pulpo {

  method hp() = 1

  method framesBase() {
    return framesPulpo
  }

  method framesMuerte() {
    return framesMuertePulpo
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 20,
      bala = balaNormalEnemiga
    )
  }

}

// Pulpo heavy
object pulpoHeavy {

  method hp() = 3

  method framesBase() {
    return framesPulpoHeavy
  }

  method framesMuerte() {
    return framesMuertePulpoHeavy
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaPesadaEnemiga
    )
  }

}

// Pulpo Rojo
object pulpoRojo {

  method hp() = 1

  method framesBase() {
    return framesPulpoRojo
  }

  method framesMuerte() {
    return framesMuertePulpoRojo
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaNormalEnemiga
    )
  }

}

// Enemigos de Elite
// Medusa
object medusa {

  method hp() = 1

  method framesBase() {
    return framesMedusa
  }

  method framesMuerte() {
    return framesMuerteMedusa
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaRapidaEnemiga
    )
  }

}

// Sepia
object sepia {

  method hp() = 1

  method framesBase() {
    return framesSepia
  }

  method framesMuerte() {
    return framesMuerteSepia
  }

  method comportamientoAtaque() {
    return new AtaqueProbabilistico(
      probabilidad = 0,
      bala = balaRapidaEnemiga
    )
  }

}

// Enemigos Especiales
// Mosca
object mosca {

  method hp() = 1

  method framesBase() {
    return framesMosca
  }

  method framesMuerte() {
    return framesMuerteMosca
  }

  method comportamientoAtaque() {
    return new AtaqueConCarga(
      probabilidadAtaque = 0,
      probabilidadCarga = 0,
      balaNormal = balaNormalEnemiga,
      balaCargada = balaCargadaEnemiga
    )
  }

}

// Kamikaze
object kamikaze {

  method hp() = 1

  method framesBase() {
    return framesKamikaze
  }

  method framesMuerte() {
    return framesMuerteKamikaze
  }

  method comportamientoAtaque() {
    return new AtaqueSoloInmolacion(
      probabilidadInmolacion = 0
    )
  }

}

// Abeja
object abeja {

  method hp() = 1

  method framesBase() {
    return framesAbeja
  }

  method framesMuerte() {
    return framesMuerteAbeja
  }

  method comportamientoAtaque() {
    return new AtaqueConInmolacion(
      probabilidadInmolacion = 0,
      probabilidadDisparo = 0,
      bala = balaNormalEnemiga
    )
  }

}

// Cangrejos: Se dejan definidos como tipos, pero todavía NO son utilizados por fabricaEnemigos.crear(), porque su clase
// y comportamiento de miniboss aún no fueron diseñados.

object cangrejoAmarillo {
}

object cangrejoAzul {
}

object cangrejoRojo {
}