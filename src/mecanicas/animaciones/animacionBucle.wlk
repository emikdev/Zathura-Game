import animacion.*

class AnimacionBucle inherits Animacion{

    /* 
        Cambia la logica de animacion para que funcione como bucle, nunca llama a
        alTerminar() de esta forma.
    */

    override method animar(){ 
        game.schedule(duracion / frames.size(), {
            frameActual = (frameActual + 1) % frames.size()
            self.animar()
        })
    }
}