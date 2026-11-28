class VisualHud {
    const nave
    const posicion
    
    method position() = posicion

    method colisionaCon(objetivo){ }

    method image()
}

class VisualVida inherits VisualHud {
    override method image() {
        if (nave.escudoActivo()) {
            // Opción A: si tenés un sprite por cada cantidad de vidas con escudo:
            //return "vida-escudo-frame" + nave.vidas().max(0) + ".png"
            
            // Opción B: si querés mostrar siempre el mismo ícono de escudo encima del corazón:
            return "buf_Escudo.png"
        } else {
            const vidasMostradas = nave.vidas().max(0).min(3)
            return "vida-frame" + vidasMostradas + ".png"
        }
    }
}


class VisualArma inherits VisualHud{
    override method image() {
        return nave.iconoArmaActual()
    }
    method text() = nave.municionActual()
}

class Numeros inherits VisualHud{
    method numeros()
    override method image() = "numero_" + self.numeros() + ".png"
}

class Centena inherits Numeros{
    override method numeros() = nave.municionActual().div(100).rem(10)
}

class Decena inherits Numeros{
    override method numeros() = nave.municionActual().div(10).rem(10)
}

class Unidad inherits Numeros{
    override method numeros() = nave.municionActual().rem(10)
}