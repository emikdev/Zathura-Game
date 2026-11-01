import src.mecanicas.armas.armas.*
import src.mecanicas.disparo.*
import src.mecanicas.direcciones.*
import src.mecanicas.animaciones.recursos.recursosArmas.*

class ArmaBasica inherits Arma {
  // arma basica es infinita
  override method consumirMunicion() {
  }
}

class ArmaLaser inherits Arma {
  // classe a utilizar para armas que gastas municion de manera dinamica
  method municionConsumida() = 2

  override method hayMunicion() = municion >= self.municionConsumida()
  // metodo dinamico que observa si hay municion 
  
  override method consumirMunicion() {
    // consumo dinamico de municion
    municion = (municion - self.municionConsumida()).max(0)
    // Previene números negativos de forma segura
  }
}

class ArmaDePlasma inherits ArmaLaser {

  override method municionConsumida() = 4

}

class ArmasConMasProyectiles inherits ArmaLaser {

  override method danoDisparo() = danoBala
  
  // Este método solo se encarga de instanciar y registrar UNA bala en una posición dada
  method generarProyectilEn(posicion, personaje) {

    const nuevoDisparo = new Disparo(
      animacion = animacion,
      dano = self.danoDisparo(),
      bando = personaje.bando(),
      position = posicion
    )

    nuevoDisparo.iniciar()
    personaje.bando().registrar(nuevoDisparo)
  }
}

class DobleCanon inherits ArmasConMasProyectiles {

  override method municionConsumida() = 2
  
  override method disparar(personaje) {

    if (personaje.bando().puedeDisparar()) {

      const posCentro = personaje.position()
      // Bala 1: En la izquierda (si se genra fuera del mapa tendria que ser eliminada por el disapro)
      self.generarProyectilEn(izquierda.siguiente(posCentro), personaje)
      
      // Bala 2: En la derecha  (si se genra fuera del mapa tendria que ser eliminada por el disapro)
      self.generarProyectilEn(derecha.siguiente(posCentro), personaje)
      
      self.consumirMunicion()
    }
  }
}

class TripleCanon inherits ArmasConMasProyectiles {

  override method municionConsumida() = 3
  
  override method disparar(personaje) {

    if (personaje.bando().puedeDisparar()) {

      const posCentro = personaje.position()
      
      // 1. Centro
      self.generarProyectilEn(posCentro, personaje)
      
      // 2. Derecha
      self.generarProyectilEn(derecha.siguiente(posCentro), personaje)
      
      // 3. Izquierda
      self.generarProyectilEn(izquierda.siguiente(posCentro), personaje)
      
      self.consumirMunicion()
      
    }
  }
} // Instancias de armas listas para la nave

// Arma Básica del Jugador (Infinita, hereda directo de Arma)
const armaBasica = new Arma(
  danoBala = 2,
  recursoBala = armaBasicaRecursos,
  municion = 100
)

// Arma Láser Estándar
const laserEstandar = new ArmaLaser(
  recursoBala = armaLaserRecursos,
  danoBala = 5,
  municion = 30
)

// Cañón de Plasma Pesado
const canonPlasma = new ArmaDePlasma(
  recursoBala = armaDePlasmaRecursos,
  danoBala = 10,
  municion = 10
)

// Instanciación del Doble Cañón
const miDobleCanon = new DobleCanon(
  recursoBala = armaLaserRecursos,
  municion = 20,
  // Cantidad total de balas iniciales
  danoBala = 5 // Daño por cada proyectil individual
)

// Instanciación del Triple Cañón
const miTripleCanon = new TripleCanon(
  recursoBala = armaLaserRecursos,
  municion = 15,
  // Gasta de a 3, dura 5 ráfagas completas
  danoBala = 7 // Daño por proyectil
)