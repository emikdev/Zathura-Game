import game.*

class Animacion{

    const estado // La animacion conoce el estado para poder cambiarlo
    const frames // Frames de la animacion tomado de un recurso de animacion
    const duracion // Duracion de la animacion tomado de un recurso de animacion
    var frameActual = 0 // Puntero de la lista de frames

    method initialize(){
        self.animar() // Al instanciarse empieza la animacion
    }

    method frameActual(){
        return frames.get(frameActual) // Devuelve frame actual de la animacion
    }

    method animar(){
        if(frameActual != frames.size() - 1){ // Verifica que frame actual no este en el final de la lista
            game.schedule(duracion / frames.size(),{ // Cada X cantidad de tiempo ejecuta el closure
                frameActual +=1 // Suma uno al puntero
                self.animar() // Se llama recursivamente
            })
        }

        self.alTerminar() // Al salit del bucle de animacion llama a terminar animacion

    }

    method alTerminar(){ // Cambia el estado 
        estado.cambiarEstado() 
    }

}