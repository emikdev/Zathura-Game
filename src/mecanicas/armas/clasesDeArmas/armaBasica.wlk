import src.mecanicas.armas.armas.*

// Arma infinita: nunca gasta munición.
// La usan tanto la nave del jugador como todos los enemigos.
class ArmaBasica inherits Arma {

    override method hayMunicion() {
        return true
    }
    
    override method consumirMunicion(){ }

}