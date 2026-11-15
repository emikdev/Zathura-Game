import src.mecanicas.bandos.*

class Muros{
    
    var salud
    var vidas = 6
    const bando

    method image(){
        return "muro-frame" + vidas.max(0) + ".png"
    }

    method colisionarCon(disparo){
        if (disparo.bando() != jugador) {
            self.recibirImpacto(disparo)
            disparo.destruir()
        }
    }

    method recibirImpacto(disparo){
        salud -= disparo.dano()
        if(salud < 1){
            self.perderVida()
        }
    }

    method perderVida(){
        vidas -= 1
        if(vidas < 1){
            self.alQuedarseSinVidas()
        }
    }

    method alQuedarseSinVidas(){
        bando.gestor().muroDestruido(self)
    }
}