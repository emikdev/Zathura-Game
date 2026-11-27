class TickeableMock {
  var ticks = 0
  var detenidos = 0
  
  method tick(deltaMs) { ticks += 1 }
  method detener() { detenidos += 1 }
  
  method ticksRecibidos() = ticks
  method vecesDetenido() = detenidos
}