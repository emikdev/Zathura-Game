class ArmaMock {
    var municion = 10

    method disparar(personaje) {
        municion -= 1
    }

    method hayMunicion() {
        return municion > 0
    }
}