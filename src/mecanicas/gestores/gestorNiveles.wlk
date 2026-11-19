import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.menu.menus.menuEntreNiveles.*
import src.menu.menus.menuVictoria.*
import src.menu.menus.menuGameOver.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tiposDeNaves.*
import src.mecanicas.gestores.gestorDePuntos.*




object gestorNiveles {

    const nivelesDelJuego = [nivelUno, nivelDos,nivelTres,nivelCuatro]   // niveles de una partida normal, en orden. Nunca se modifica.
    var niveles = nivelesDelJuego        // niveles de la partida en curso (la normal o la demo)
    var indice = 0                       // posición, en "niveles", del nivel que se está jugando
    var property contadorDeNiveles = 1

    method iniciar() { // Arranca el generador de ovnis y carga el nivel actual
        game.boardGround("fondo.png")
        generadorOvnis.iniciar()
        self.nivelActual().iniciar()
        gestorNaves.iniciar()
    }

    method nivelActual() {
        return niveles.get(indice)
    }

    method haySiguienteNivel() { // Queda algún nivel después del actual
        return indice < niveles.size() - 1
    }

    method terminarNivel() { // Método llamado por nivel
        if (self.haySiguienteNivel()) {
            indice += 1
            musicaInGame.detener()
            entreNiveles.iniciarMenu() // Cuando se da a continuar se inicia el siguiente nivel
            contadorDeNiveles += 1
        } else {
            self.ganar()
        }
    }

    // Deja todo listo para una partida nueva, desde el primer nivel
    method reiniciar() {
        niveles = nivelesDelJuego
        indice = 0
        contadorDeNiveles = 1
    }

    method ganar() {
        musicaInGame.detener()
        musicaVictoria.iniciar()
        generadorOvnis.detener()
        victoria.iniciarMenu()
        self.reiniciar()
    }

    method gameOver() {
        musicaInGame.detener()
        generadorOvnis.detener()
        gameOver.iniciarMenu()
        self.reiniciar()
    }


    method mostrar() {
        const level = new Cartel (image = "lvl.png", position = game.at(0,game.height() -1) )
        game.addVisual(level)
        game.addVisual(contador)
    }

}


    object contador inherits Numero {
    override method position() = game.at(2, game.height() - 1)
    override method numero() = gestorNiveles.contadorDeNiveles()
}