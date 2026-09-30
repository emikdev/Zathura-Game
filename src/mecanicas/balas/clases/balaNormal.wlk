import src.mecanicas.balas.bala.*

class BalaNormal inherits Bala {

    // Sobreescribimos los métodos del padre con los valores fijos de esta bala
    override method frames() = [
        "disparo-frame1.png", 
        "disparo-frame2.png",
        "disparo-frame3.png"
    ]

    override method velocidad() = 2

    override method dano() = 50 
    
    // Si querremos que la bala normal sea infinita, podés sobreescribir también esto: o darle sobrecalientamientol
    // SOLUCIÓN: Al sobreescribirlo vacío, esta bala jamás consume su munición
    override method consumirMunicion() {
        // No hace nada, es infinita
    }
}
