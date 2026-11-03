object configuracion {
  
  var property dificultadElegida = 1
  var property cantidadJugadores = 1
  const property tiposNaves = []

  method dificultad() {

      return dificultadElegida + cantidadJugadores
  }

  // como configuracion es quien tiene los datos necesarios para calcular la dificultad lo calcula el mismo objeto.
}