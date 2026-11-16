import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.menu.menu.*
import src.menu.seleccionador.*


object gestorNiveles {

    const niveles = [nivelUno]
    var contadorDeNiveles = 1

    method contadorDeNiveles() = contadorDeNiveles // getter de puntos

    method iniciar() { // Arranca el generador de ovnis y carga el primer nivel
        generadorOvnis.iniciar()
        self.nivelActual().iniciar()
        gestorNaves.iniciar()
    }

    method nivelActual() { // Primer nivel de la lista
        return niveles.first()
    }

    method removerNivelActual() {
        niveles.remove(self.nivelActual())
    }

    method haySiguienteNivel() { // Quedan niveles después de sacar el actual
        return not niveles.isEmpty()
    }

    

method terminarNivel() { // Método llamado por nivel
        self.removerNivelActual()

        if (self.haySiguienteNivel()) {
            menu.menuEntreNiveles() // Cuando se da a continuar se inicia el siguiente nivel
            contadorDeNiveles += 1
        } else {
            self.ganar()
        }
    }

    method ganar() {
        musicaInGame.detener()
        musicaVictoria.iniciar()
        generadorOvnis.detener()
        menu.menuVictoria()
    }

    method gameOver() {
        musicaInGame.detener()
        generadorOvnis.detener()
        menu.menuGameOver()
    }


    method mostrar() {
        const level = new Cartel (image = "lvl.png", position = game.at(0,game.height() -1) )
        game.addVisual(level)
        game.addVisual(contador)
    }

}

    class Numero {
    method position()
    method numero()
    method image() = "numero_" + self.numero().toString() + ".png"
}

    object contador inherits Numero {
    override method position() = game.at(2, game.height() - 1)
    override method numero() = gestorNiveles.contadorDeNiveles()
}