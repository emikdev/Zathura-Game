class VisualHud {
    const nave
    const posicion
    
    method position() = posicion

    method colisionaCon(objetivo){ }

    method image()
}

class VisualVida inherits VisualHud {
    override method image() {
        return "vida-frame" + nave.vidas().max(0) + ".png"
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

class Decena inherits Numeros{
    override method numeros() = nave.municionActual().div(10).rem(10)
}

class Unidad inherits Numeros{
    override method numeros() = nave.municionActual().rem(10)
}