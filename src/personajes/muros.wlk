import src.mecanicas.gestores.gestorDeMuros.*
import src.mecanicas.animaciones.recursos.recursosMuros.*
import src.mecanicas.animaciones.animacion.*

class Muro{
    
    var vidas
    const position
    const animacionBase = muroFramesBase
    const animacionMuerte = muroFramesMuerte
    var animacionActual = self.frameBaseActual()

    method position(){
        return position
    }

    method frameBaseActual(){
        return animacionBase.frames().get(vidas-1)
    }
    
    method image(){
        return animacionActual
    }

    method colisionaCon(disparo){
     
        self.perderVida()
        disparo.destruir()
    
    }

    method perderVida(){
        vidas -= 1
        if(vidas < 1){
            self.alQuedarseSinVidas()
        }else{
            animacionActual = self.frameBaseActual()
        }
    }

    method alQuedarseSinVidas(){
        animacionActual = new Animacion(estado = self, recursoDeAnimacion = animacionMuerte)
    }

    method terminoAnimacion(){
        gestorMuros.muroDestruido(self)
    }

}