import src.gestores.gestorNiveles.*
import wollok.game.*
import src.mecanicas.direcciones.*
import src.gestores.reloj.*

class Formacion {
  const nivel
  const intervalo // Ya es un numero (ej: 800)
  
  const enemigos = []
  const enemigosEnInmolacion = []
  
  var direccion = derecha
  var acumulado = 0

  method initialize() {
    reloj.registrar(self)
  }

  method agregar(enemigo) { enemigos.add(enemigo) }
  method intervalo() = intervalo

  method tick(deltaMs) {
    acumulado += deltaMs
    if (acumulado >= intervalo) {
      acumulado = 0
      self.paso()
    }
  }

  method paso() {
    enemigos.copy().forEach({ e => e.prepararPaso() })
    self.mover()
    self.enemigosGanaron()
    self.atacar()
  }

  method enemigosGanaron() {
    if (enemigos.any({ enemigo => not abajo.puedeAvanzar(enemigo.position()) })) {
      self.detener()
      gestorNiveles.gameOver()
    }
  }

  method mover() {
    if (self.todosPuedenAvanzar()) {
      enemigos.forEach({ enemigo => enemigo.mover(direccion) })
    } else {
      enemigos.forEach({ enemigo => enemigo.mover(abajo) })
      direccion = direccion.opuesta()
    }
  }

  method todosPuedenAvanzar() {
    return enemigos.all({ enemigo => direccion.puedeAvanzar(enemigo.position()) })
  }

  method atacar() {
    self.enemigosEnPrimeraLinea().forEach({ enemigo => enemigo.intentarAtacar() })
  }

  method enemigosEnPrimeraLinea() {
    return enemigos.filter({ enemigo => self.estaAlFrente(enemigo) })
  }

  method estaAlFrente(enemigo) {
    return not enemigos.any({ otro =>
      otro.position().x() == enemigo.position().x() &&
      otro.position().y() < enemigo.position().y()
    })
  }

  method sacarDeLista(enemigo) { 
    enemigos.remove(enemigo) 
  }

  method quitar(enemigo) {
    self.sacarDeLista(enemigo)
    self.verificarVacia()
  }

  method registrarEnemigoLibre(enemigo) {
    if (not enemigosEnInmolacion.contains(enemigo)) {
      enemigosEnInmolacion.add(enemigo)
    }
  }

  method olvidarEnemigoLibre(enemigo) {
    enemigosEnInmolacion.remove(enemigo)
  }

  method verificarVacia() {
    if (enemigos.isEmpty()) {
      self.detener() // Lo saca del reloj
      nivel.formacionVacia(self)
    }
  }

  method detener() {
    reloj.olvidar(self) 
  }

  method hayEnemigoEn(posicion, disparo) {
    const todosLosEnemigos = enemigos + enemigosEnInmolacion
    
    const enemigosChocados = todosLosEnemigos.filter({ e => 
      e.position() == posicion && not e.esMuriendo() 
    })
    
    if (not enemigosChocados.isEmpty()) {
      enemigosChocados.first().colisionaCon(disparo)
    }
  }

  method retirar() {
    enemigos.forEach({ e => e.retirar() })
    enemigosEnInmolacion.forEach({ e => e.retirar() })
    reloj.olvidar(self)
  }
}