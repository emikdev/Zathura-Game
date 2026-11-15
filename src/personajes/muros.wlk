import src.mecanicas.gestores.gestorDeMuros.*
class Muro{
    
    var vidas
    const position

    method position(){
        return position
    }
    
    method image(){
        return "muro-frame" + vidas.max(0) + ".png"
    }

    method colisionarCon(disparo){
     
        self.perderVida()
        disparo.destruir()
    
    }

    method perderVida(){
        vidas -= 1
        if(vidas < 1){
            self.alQuedarseSinVidas()
        }
    }

    method alQuedarseSinVidas(){
        gestorMuros.muroDestruido(self)
    }
}