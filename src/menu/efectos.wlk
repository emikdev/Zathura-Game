
object efectos {
    
    method reproducir(archivo) {
        const sonido = game.sound(archivo)
        sonido.volume(1)
        sonido.play()
    }
}