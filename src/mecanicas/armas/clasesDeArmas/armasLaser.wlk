import src.mecanicas.armas.armas.*

// Armas que gastan munición de manera dinámica (más de 1 unidad por disparo)
class ArmaLaser inherits Arma {
    override method municionConsumida() = 2

    // Hay munición solo si alcanza para un disparo completo
    override method hayMunicion() = municion >= self.municionConsumida()

    override method consumirMunicion() {
        // Previene números negativos de forma segura
        municion = (municion - self.municionConsumida()).max(0)
    }
}

class ArmaDePlasma inherits ArmaLaser {
    override method municionConsumida() = 4
}