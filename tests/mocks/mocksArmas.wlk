// Bando falso: registra los disparos que recibe y permite controlar si puede disparar.
class BandoEspia {
  const permiteDisparar = true
  const disparosRegistrados = []

  method ajustarPosicion(posicion) = posicion
  method puedeDisparar() = permiteDisparar
  method registrar(disparo) { disparosRegistrados.add(disparo) }
  method liberar(disparo) { }

  method disparosRegistrados() = disparosRegistrados
}

// Igual que BandoEspia, pero ajusta la posición de la bala una celda hacia arriba,
// como hacen los bandos reales (el jugador sube, el enemigo baja).
class BandoEspiaQueAjusta inherits BandoEspia {
  override method ajustarPosicion(posicion) = posicion.up(1)
}

// Personaje mínimo: lo único que usan las armas es su bando y su posición.
class PersonajeMock {
  const bando
  const position

  method bando() = bando
  method position() = position
}