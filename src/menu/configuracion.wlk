import src.personajes.factory.factory.*
import src.mecanicas.direcciones.*
object configuracion {
  
  var property dificultadElegida = 1
  var property cantidadJugadores = 1
  const property tiposNaves = []

  method dificultad() {        
          
           // como configuracion es quien tiene los datos necesarios para calcular la dificultad lo calcula el mismo objeto.

      return dificultadElegida + cantidadJugadores - 1
  }


  method naves() = tiposNaves.map({ tipo => factory.crearNave(tipo , game.at(7, tablero.filaMinima())) } )

}