class BandoEspia {
  const permiteDisparar
  const disparosRegistrados = []

  method ajustarPosicion(posicion) = posicion
  method puedeDisparar() = permiteDisparar
  method registrar(disparo) { disparosRegistrados.add(disparo) }
  method liberar(disparo) { }
  
  method direccionDeDisparo() = null 
  method verificarColisionesDeDisparo(disparo, posicion) { }

  method disparosRegistrados() = disparosRegistrados
}

class BandoEspiaQueAjusta inherits BandoEspia {
  override method ajustarPosicion(posicion) = posicion.up(1)
}