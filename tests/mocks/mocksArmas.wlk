class BandoEspia {
  const permiteDisparar = true
  const disparosRegistrados = []

  method ajustarPosicion(posicion) = posicion
  method puedeDisparar() = permiteDisparar
  method registrar(disparo) { disparosRegistrados.add(disparo) }
  method liberar(disparo) { }
  
  // Nuevos métodos del refactor:
  method direccionDeDisparo() = null 
  method verificarColisionesDeDisparo(disparo, posicion) { }

  method disparosRegistrados() = disparosRegistrados
}