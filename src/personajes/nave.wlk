import game.*
import src.mecanicas.direcciones.*


// Habria que retocar el codigo para quitar el miedo al booleano

class Nave {
    var property image 
    var property position 
    var property vidas

    var disparando = false
    var estaViva = true
    

    method mover(direccion){
        if(estaViva){
            const nuevaPosition = direccion.siguiente(position)
            position = nuevaPosition
        }
	}

    method naveImpactada(){
        if(estaViva){
            self.naveDestruida()
        }
    }

    method naveDestruida(){
        if(vidas  > 0){
            estaViva = false
            game.say(self, "Estas muerto")

            game.schedule(5000, {
                vidas -=1
                position = game.origin()
                estaViva = true
            })

        }else{
            estaViva = false
            game.error("Te quedaste sin vidas")
        }    
    }

    // El metodo disparar esta incompleto, solo lanza la animacion, pero no lanza el proyectil aun

    method disparar(frameList){
        
        if(not disparando){
            disparando = true
            animator.createAnimation(self, 100, frameList)
            disparando = false
        }

    }

}

/*

    ANIMATOR ES UN OBJETO CON LOS ELEMENTOS NECESARIOSA PARA CREAR UNA ANIMACION
    POR MEDIO DE UNA LISTA ORDENADA DE STRINGS CON LA UBICACION DE LAS IMAGENES
    PARA ANIMAR

    Para crear una animacion se tiene que llamar al metodo 
    createAnimation(element, animationSpeed, frameList), en element se debe pasar
    el objeto que se desea animar, animationSpeed espera la cantidad de tiempo que
    tiene que haber entre frame y frame (se tiene que pasar en milisegundos), y 
    frameList es una lista ordenada que requiere los strings con las ubicaciones
    de las imagenes, no se requiere que se pase la imagen del estado inicial del
    objeto.

    REQUIERE WOLLOK GAME

*/
object animator{

    var frame = 0

    method createAnimation(element, animationSpeed, frameList){

        frameList.addAtIndex(0, element.image())
        
        if(frame < frameList.size()-1){
            game.schedule(animationSpeed, {self.nextFrame(element, animationSpeed, frameList)})
            
        }else {
            game.schedule(animationSpeed, {self.endAnimation(element, frameList)})
        }
    }
    
    method nextFrame(element, animationSpeed, frameList){
        frame += 1
        element.image(frameList.get(frame))
        self.createAnimation(element, animationSpeed, frameList)
    }

    method endAnimation(element, frameList){
        frame = 0
        element.image(frameList.get(frame))
    }
}

const naveDefault = new Nave(
    image = "naves/nave.png",
    vidas = 3,
    position = game.origin()
)
