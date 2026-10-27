import src.mecanicas.animaciones.animacion.*

// "Null object" polimorfico
object sinEfecto {
    method imagen(imagenBase) = imagenBase   // no altera lo que se dibuja
    method detener() { }
}

// Clase polimorfica con el "Null object"
class EfectoVisual {
    const personaje
    var animacion

    override method initialize() {
        super()
        animacion = new Animacion(estado = self, recursoDeAnimacion = self.recursoAnimacion())
    }

    method recursoAnimacion()   // lo define cada subclase
    method terminoAnimacion()   // lo define cada subclase

    method imagen(imagenBase) = animacion.frameActual()
    method detener() { animacion.detener() }
}