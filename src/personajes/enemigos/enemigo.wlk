import wollok.game.*

// Definicion de la Superclase abstracta "Enemigo"
class Enemigo {

	var property position // Atributo correspondiente a la posicion del objeto (Getter y Setter autodefinido)
	var frameActual = 0 // Atributo correspondiente al frame actual que debe mostrarse

	method frames() // Metodo abstracto, es decir, cada subclase define sus imágenes

    // Getter que retorna la imagen correspondiente

	method image(){
        
        return self.frames().get(frameActual) 
        
    }

    // Setter que permite interpolar los frames de la animacion (No es un metodo abstracto ya que todas las sub-clases van a usarlo tal cual)

	method animar() {

		frameActual = (frameActual + 1) % self.frames().size() /* Se toma el nuemro de frame actual, se le suma 1 y se lo divide por el tamano de la lista, 
                                                    asegurandose de que no se salga de rango y pueda haber enemigos con distinta cantidad de frames de animacion */

	}

}