import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.mecanicas.gestores.gestorBufos.* // 1. Importar el gestor de bufos
import src.menu.menu.*
import src.menu.seleccionador.*


object gestorNiveles {

    const niveles = [nivelUno]
    var contadorDeNiveles = 1

    method contadorDeNiveles() = contadorDeNiveles // getter de puntos

    method iniciar() { // Arranca el generador de ovnis y carga el primer nivel
        generadorOvnis.iniciar()
        gestorBufos.iniciar() // Arranca la caída de bufos
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
        gestorBufos.detener() // Limpia los bufos en pantalla antes de mostrar el menú entre niveles

        if (self.haySiguienteNivel()) {
            menu.menuEntreNiveles() // Cuando se da a continuar se inicia el siguiente nivel
            gestorBufos.iniciar() // Vuelve a activarlos cuando arranca el siguiente nivel
            contadorDeNiveles += 1
        } else {
            self.ganar()
        }
    }

    method ganar() {
        musicaInGame.detener()
        musicaVictoria.iniciar()
        generadorOvnis.detener()
        gestorBufos.detener() // Limpia todo al ganar
        menu.menuVictoria()
    }

    method gameOver() {
        musicaInGame.detener()
        generadorOvnis.detener()
        gestorBufos.detener() // Limpia todo al perder
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
