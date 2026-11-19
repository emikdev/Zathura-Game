import src.mecanicas.animaciones.animacion.*

// "Null object" polimorfico
object sinEfecto {
    method imagen(imagenBase) = imagenBase
    method detener() { }
    // Si el personaje le manda terminarEfecto, no hace nada
    method terminar() { }
}

// Clase polimorfica con el "Null object"
class EfectoVisual {
    const personaje
    var animacion

    method initialize() {
        animacion = new Animacion(
            estado = self, 
            recursoDeAnimacion = self.recursoAnimacion(),
            autoAvance = true
        )
    }

    method recursoAnimacion()   // lo define cada subclase
    method terminoAnimacion()   // lo define cada subclase

    method imagen(imagenBase){
        return animacion.frameActual()
    }
    
    method detener(){ 
        animacion.detener() 
    }
    
    // Un mensaje general para que el efecto se limpie a sí mismo
    method terminar() {
        self.detener()
        personaje.quitarEfecto() // El personaje decide qué poner por defecto
    }
}