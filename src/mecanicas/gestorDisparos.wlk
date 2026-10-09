import src.mecanicas.bandos.*

object gestorDisparos {
  // Creamos los diccionarios usando la sintaxis oficial de Wollok
  const disparosPorBando = new Dictionary()
  const limitesPorBando = new Dictionary()

  method initialize() {
    // Asociamos cada OBJETO bando con su lista inicial de disparos
    disparosPorBando.put(bandoJugador, [])
    disparosPorBando.put(bandoEnemigo, [])

    // Asociamos cada OBJETO bando con su límite numérico
    limitesPorBando.put(bandoJugador, 10)   
    limitesPorBando.put(bandoEnemigo, 5)   
  }

  method puedeDisparar(bando) {
    const activos = disparosPorBando.get(bando)
    const limite = limitesPorBando.get(bando)
    return activos.size() < limite
  }

  method registrarDisparo(disparo, bando) {
    const activos = disparosPorBando.get(bando)
    if (not activos.contains(disparo)) {
      activos.add(disparo)
    }
  }

  method liberarDisparo(disparo, bando) {
    const activos = disparosPorBando.get(bando)
    const activosActualizados = activos.filter({ registrado => registrado != disparo })
    
    // Volvemos a guardar la lista limpia en el diccionario para actualizarla
    disparosPorBando.put(bando, activosActualizados)
  }
}
