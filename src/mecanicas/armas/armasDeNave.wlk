import src.mecanicas.armas.armas.*
import src.mecanicas.animaciones.animacion.*
import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*
import src.mecanicas.disparo.*
import src.mecanicas.direcciones.*



class ArmaLaser inherits Arma {
  var property municion = 10 // el valor siempre tiene que ser par 

  override method hayMunicion() = municion >= 2
  override method consumirMunicion() {
    municion = (municion - 2).max(0) // Previene números negativos de forma segura
  }
  override method recargar(cantidad) {
    municion = municion + cantidad
  }
}

class ArmaDePlasma inherits ArmaLaser {
    override method hayMunicion() = municion >= 4
    override method consumirMunicion() {
    municion = (municion - 4).max(0) // Previene números negativos de forma segura
  }
}

class ArmasConMasProyectiles inherits ArmaLaser {
  
  // Este método solo se encarga de instanciar y registrar UNA bala en una posición dada
  method generarProyectilEn(posicion, personaje) {
    const nuevoDisparo = new Disparo(
      recursoDeAnimacion = recursoBala,
      dano = dano,
      bando = personaje.bando(),
      position = posicion
    )
    nuevoDisparo.iniciar()
    personaje.bando().registrar(nuevoDisparo)
  }
}

class DobleCanon inherits ArmasConMasProyectiles {
  
  override method disparar(personaje) {
    if (self.hayMunicion() and personaje.bando().puedeDisparar()) {
      const posCentro = personaje.position()

      // Bala 1: En la izquierda (si es posible)
      if (izquierda.puedeAvanzar(posCentro)) {
        self.generarProyectilEn(izquierda.siguiente(posCentro), personaje)
      }
      // Bala 2: En la derecha (si es posible)
      if (derecha.puedeAvanzar(posCentro)) {
        self.generarProyectilEn(derecha.siguiente(posCentro), personaje)
      }

      self.consumirMunicion()
    }
  }

  override method hayMunicion() = municion >= 2
  override method consumirMunicion() {
    municion = (municion - 2).max(0)
  }
}

class TripleCanon inherits ArmasConMasProyectiles {

  override method disparar(personaje) {
    if (self.hayMunicion() and personaje.bando().puedeDisparar()) {
      const posCentro = personaje.position() 

      // 1. Centro
      self.generarProyectilEn(posCentro, personaje)

      // 2. Derecha
      if (derecha.puedeAvanzar(posCentro)) {
        self.generarProyectilEn(derecha.siguiente(posCentro), personaje)
      }

      // 3. Izquierda
      if (izquierda.puedeAvanzar(posCentro)) {
        self.generarProyectilEn(izquierda.siguiente(posCentro), personaje)
      }

      self.consumirMunicion()
    }
  }
  
  override method hayMunicion() = municion >= 3
  override method consumirMunicion() {
    municion = (municion - 3).max(0)
  }
}

// Instancias de armas listas para la nave
// Arma Básica del Jugador (Infinita, hereda directo de Arma)
const armaBasica = new Arma(
  dano = 2,
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "disparoCeleste_frame_1.png",
      "disparoCeleste_frame_2.png",
      "disparoCeleste_frame_3.png"
      ],duracion= 500
  )
)
// Arma Láser Estándar
const laserEstandar = new ArmaLaser(
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "ArmaLaser_frame_1.png",
      "ArmaLaser_frame_2.png",
      "ArmaLaser_frame_3.png"
    ],duracion = 50
  ),
  dano = 5,      // Corregido danoBala -> dano
  municion = 30
)

// Cañón de Plasma Pesado
const canonPlasma = new ArmaDePlasma(
  recursoBala = new RecursosDeAnimacion(
    frames = [
      "ArmaDePlasma_frame_1.png",
      "ArmaDePlasma_frame_2.png",
      "ArmaDePlasma_frame_3.png"
    ],duracion= 500
  ),
  dano = 10,      // Corregido danoBala -> dano
  municion = 10
)

// Instanciación del Doble Cañón
const miDobleCanon = new DobleCanon(
    recursoBala = new RecursosDeAnimacion(
    frames = [
      "ArmaLaser_frame_1.png",
      "ArmaLaser_frame_2.png",
      "ArmaLaser_frame_3.png"
    ],duracion= 500
    ),
    municion = 20,              // Cantidad total de balas iniciales
    dano = 5                   // Daño por cada proyectil individual
)

// Instanciación del Triple Cañón
const miTripleCanon = new TripleCanon(
    recursoBala = new RecursosDeAnimacion(
    frames = [
      "ArmaLaser_frame_1.png",
      "ArmaLaser_frame_2.png",
      "ArmaLaser_frame_3.png"
    ],duracion= 500
    ),
    municion = 15,              // Gasta de a 3, dura 5 ráfagas completas
    dano = 7                   // Daño por proyectil
)