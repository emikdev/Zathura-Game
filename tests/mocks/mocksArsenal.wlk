class ArmaMock{
    var municion

    method disparar(personaje){
        municion -=1
    }

    method hayMunicion() {
        return municion > 0
    }
}