import wollok.game.*

class SonidoAmbiente {
  const archivo
  const repetir = true
  const volumen = 0.5
  var estado = apagada

  method estado(nuevo) { estado = nuevo }

  method iniciar() { estado.iniciar(self) }
  method detener() { estado.detener(self) }

  method sonidoNuevo() {
    const sonido = game.sound(archivo)
    sonido.shouldLoop(repetir)
    sonido.volume(volumen)
    return sonido
  }
}

object apagada {
  method iniciar(sonidoAmbiente) {
    const sonido = sonidoAmbiente.sonidoNuevo()
    sonido.play()
    sonidoAmbiente.estado(new Sonando(sonido = sonido))
  }

  method detener(sonidoAmbiente) {}
}

class Sonando {
  const sonido

  method iniciar(sonidoAmbiente) {}

  method detener(sonidoAmbiente) {
    if (sonido.played()){
      sonido.stop()  
    }
    sonidoAmbiente.estado(apagada)
  }
}

object musicaMenu inherits SonidoAmbiente(archivo = "musicaFondoMenu.mp3") {}

object musicaInGame inherits SonidoAmbiente(archivo = "inGame.mp3") {}

object musicaGameOver inherits SonidoAmbiente(archivo = "gameOver.mp3") {}

object musicaVictoria inherits SonidoAmbiente(archivo = "victoria.mp3") {}