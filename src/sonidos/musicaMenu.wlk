import wollok.game.*

class SonidoAmbiente {
  const archivo
  const repetir = true
  const volumen = 0.5
  var estado = apagada
  var pista = null

  method estado(nuevo) { estado = nuevo }

  method iniciar() { estado.iniciar(self) }
  method detener() { estado.detener(self) }

  method obtenerPista() {
    if (pista == null) {
      pista = game.sound(archivo)
      pista.shouldLoop(repetir)
      pista.volume(volumen)
    }
    return pista
  }
}

object apagada {
  method iniciar(sonidoAmbiente) {
    const pista = sonidoAmbiente.obtenerPista()
    pista.play()
    sonidoAmbiente.estado(sonando)
  }

  method detener(sonidoAmbiente) { }
}

object sonando {
  method iniciar(sonidoAmbiente) { }

  method detener(sonidoAmbiente) {
    const pista = sonidoAmbiente.obtenerPista()
    if (pista.played()) {
      pista.stop()
    }
    sonidoAmbiente.estado(apagada)
  }
}

object musicaMenu inherits SonidoAmbiente(archivo = "musicaFondoMenu.mp3") { }

object musicaInGame inherits SonidoAmbiente(archivo = "inGame.mp3") { }

object musicaVictoria inherits SonidoAmbiente(archivo = "victoria.mp3") { }
