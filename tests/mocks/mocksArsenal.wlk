class ArmaMock{
    var municion

    method disparar(){
        municion -=1
    }

    method hayMunicion() {
        return municion > 0
    }
}