import src.personajes.comportamiento.movimiento.movimientosEnemigo.*

// Cuando es kamikaze, baja en picada a inmolarse
class MovimientoKamikaze inherits ComportamientoMovimiento {
  const intervalo
  var acumulado = 0

  override method tick(enemigo, deltaMs) {
    acumulado += deltaMs
    if (acumulado >= (intervalo / 2)) {
      acumulado = 0
      enemigo.avanzarKamikaze()
    }
  }
}

/* Ya se que en wollok normalmente no se hace y hasta puede estar mal visto pero me resulta comodo tene un contrato 
    - emikdev */