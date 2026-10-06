import src.mecanicas.comportamiento.ataque.ataqueProbabilistico.*
import src.mecanicas.comportamiento.ataque.ataqueConCarga.*
import src.mecanicas.comportamiento.ataque.ataqueKamikaze.*
import src.mecanicas.comportamiento.ataque.ataqueConInmolacion.*
import src.mecanicas.balas.bala.*
import src.mecanicas.balas.clases.balaNormalEnemiga.*
import src.mecanicas.balas.clases.balaPesadaEnemiga.*
import src.mecanicas.balas.clases.balaRapidaEnemiga.*
import src.mecanicas.balas.clases.balaCargadaEnemiga.*

// Frames de enemigos y sus animaciones de muerte
const framesAlien = ["alien-frame1.png", "alien-frame2.png"]
const framesMuerteAlien = [
  "muerteBlanco-frame1.png",
  "muerteBlanco-frame2.png",
  "muerteBlanco-frame3.png",
  "muerteBlanco-frame4.png",
  "muerteBlanco-frame5.png"
]

const framesAlienHeavy = ["enemigos/alienHeavy/alienHeavy-frame1.png", "enemigos/alienHeavy/alienHeavy-frame2.png"]
const framesMuerteAlienHeavy = [
  "enemigos/alienHeavy/muerte/muerte-frame1.png",
  "enemigos/alienHeavy/muerte/muerte-frame2.png",
  "enemigos/alienHeavy/muerte/muerte-frame3.png",
  "enemigos/alienHeavy/muerte/muerte-frame4.png",
  "enemigos/alienHeavy/muerte/muerte-frame5.png"
]

const framesAlienAzul = ["enemigos/alienAzul/alienAzul-frame1.png", "enemigos/alienAzul/alienAzul-frame2.png"]
const framesMuerteAlienAzul = [
  "enemigos/alienAzul/muerte/muerte-frame1.png",
  "enemigos/alienAzul/muerte/muerte-frame2.png",
  "enemigos/alienAzul/muerte/muerte-frame3.png",
  "enemigos/alienAzul/muerte/muerte-frame4.png",
  "enemigos/alienAzul/muerte/muerte-frame5.png"
]

const framesCalamar = ["calamar-frame1.png", "calamar-frame2.png"]
const framesMuerteCalamar = [
  "muerteBlanco-frame1.png",
  "muerteBlanco-frame2.png",
  "muerteBlanco-frame3.png",
  "muerteBlanco-frame4.png",
  "muerteBlanco-frame5.png"
]

const framesCalamarHeavy = ["enemigos/calamarHeavy/calamarHeavy-frame1.png", "enemigos/calamarHeavy/calamarHeavy-frame2.png"]
const framesMuerteCalamarHeavy = [
  "enemigos/calamarHeavy/muerte/muerte-frame1.png",
  "enemigos/calamarHeavy/muerte/muerte-frame2.png",
  "enemigos/calamarHeavy/muerte/muerte-frame3.png",
  "enemigos/calamarHeavy/muerte/muerte-frame4.png",
  "enemigos/calamarHeavy/muerte/muerte-frame5.png"
]

const framesCalamarAmarillo = ["enemigos/calamarAmarillo/calamarAmarillo-frame1.png", "enemigos/calamarAmarillo/calamarAmarillo-frame2.png"]
const framesMuerteCalamarAmarillo = [
  "enemigos/calamarAmarillo/muerte/muerte-frame1.png",
  "enemigos/calamarAmarillo/muerte/muerte-frame2.png",
  "enemigos/calamarAmarillo/muerte/muerte-frame3.png",
  "enemigos/calamarAmarillo/muerte/muerte-frame4.png",
  "enemigos/calamarAmarillo/muerte/muerte-frame5.png"
]

const framesPulpo = ["pulpo-frame1.png", "pulpo-frame2.png"]
const framesMuertePulpo = [
  "muerteBlanco-frame1.png",
  "muerteBlanco-frame2.png",
  "muerteBlanco-frame3.png",
  "muerteBlanco-frame4.png",
  "muerteBlanco-frame5.png"
]

const framesPulpoHeavy = ["enemigos/pulpoHeavy/pulpoHeavy-frame1.png", "enemigos/pulpoHeavy/pulpoHeavy-frame2.png"]
const framesMuertePulpoHeavy = [
  "enemigos/pulpoHeavy/muerte/muerte-frame1.png",
  "enemigos/pulpoHeavy/muerte/muerte-frame2.png",
  "enemigos/pulpoHeavy/muerte/muerte-frame3.png",
  "enemigos/pulpoHeavy/muerte/muerte-frame4.png",
  "enemigos/pulpoHeavy/muerte/muerte-frame5.png"
]

const framesPulpoRojo = ["enemigos/pulpoRojo/pulpoRojo-frame1.png", "enemigos/pulpoRojo/pulpoRojo-frame2.png"]
const framesMuertePulpoRojo = [
  "enemigos/pulpoRojo/muerte/muerte-frame1.png",
  "enemigos/pulpoRojo/muerte/muerte-frame2.png",
  "enemigos/pulpoRojo/muerte/muerte-frame3.png",
  "enemigos/pulpoRojo/muerte/muerte-frame4.png",
  "enemigos/pulpoRojo/muerte/muerte-frame5.png"
]

const framesMedusa = ["enemigos/medusa/medusa-frame1.png", "enemigos/medusa/medusa-frame2.png"]
const framesMuerteMedusa = [
  "enemigos/medusa/muerte/muerte-frame1.png",
  "enemigos/medusa/muerte/muerte-frame2.png",
  "enemigos/medusa/muerte/muerte-frame3.png",
  "enemigos/medusa/muerte/muerte-frame4.png",
  "enemigos/medusa/muerte/muerte-frame5.png"
]

const framesSepia = ["enemigos/sepia/sepia-frame1.png", "enemigos/sepia/sepia-frame2.png"]
const framesMuerteSepia = [
  "enemigos/sepia/muerte/muerte-frame1.png",
  "enemigos/sepia/muerte/muerte-frame2.png",
  "enemigos/sepia/muerte/muerte-frame3.png",
  "enemigos/sepia/muerte/muerte-frame4.png",
  "enemigos/sepia/muerte/muerte-frame5.png"
]

const framesMosca = ["enemigos/mosca/mosca-frame1.png", "enemigos/mosca/mosca-frame2.png"]
const framesMuerteMosca = [
  "enemigos/mosca/muerte/muerte-frame1.png",
  "enemigos/mosca/muerte/muerte-frame2.png",
  "enemigos/mosca/muerte/muerte-frame3.png",
  "enemigos/mosca/muerte/muerte-frame4.png",
  "enemigos/mosca/muerte/muerte-frame5.png"
]

const framesKamikaze = ["enemigos/kamikaze/kamikaze-frame1.png", "enemigos/kamikaze/kamikaze-frame2.png"]
const framesMuerteKamikaze = [
  "enemigos/kamikaze/muerte/muerte-frame1.png",
  "enemigos/kamikaze/muerte/muerte-frame2.png",
  "enemigos/kamikaze/muerte/muerte-frame3.png",
  "enemigos/kamikaze/muerte/muerte-frame4.png",
  "enemigos/kamikaze/muerte/muerte-frame5.png"
]

const framesAbeja = ["enemigos/abeja/abeja-frame1.png", "enemigos/abeja/abeja-frame2.png"]
const framesMuerteAbeja = [
  "enemigos/abeja/muerte/muerte-frame1.png",
  "enemigos/abeja/muerte/muerte-frame2.png",
  "enemigos/abeja/muerte/muerte-frame3.png",
  "enemigos/abeja/muerte/muerte-frame4.png",
  "enemigos/abeja/muerte/muerte-frame5.png"
]

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