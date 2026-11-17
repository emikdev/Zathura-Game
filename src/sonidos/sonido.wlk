import wollok.game.*

object sonido {
  const efectosCargados = new Dictionary()

  const efectosDelJuego = [
    "disparo.mp3",
    "disparo2.mp3",
    "impacto.mp3",
    "choose.mp3",
    "opciones.mp3",
    "pierdeVida.mp3",
    "muerteDefinitiva.mp3",
    "levelPassed.mp3",
    "fail.mp3"
  ]

  method precargarTodos() {
    efectosDelJuego.forEach({ archivo => self.obtener(archivo) })
  }

  method obtener(archivo) {
    if (!efectosCargados.containsKey(archivo)) {
      const nuevoSonido = game.sound(archivo)
      nuevoSonido.volume(0.8)
      efectosCargados.put(archivo, nuevoSonido)
    }
    return efectosCargados.get(archivo)
  }

  method reproducir(archivo) {
    const efecto = self.obtener(archivo)
    if (efecto.played()) {
      efecto.stop()
    }
    efecto.play()
  }
}
