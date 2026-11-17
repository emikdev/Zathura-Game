import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.menu.menu.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tiposDeNaves.*
import src.mecanicas.gestores.gestorDePuntos.*



object gestorNiveles {

    const nivelesDelJuego = [nivelUno]   // niveles de una partida normal, en orden. Nunca se modifica.
    var niveles = nivelesDelJuego        // niveles de la partida en curso (la normal o la demo)
    var indice = 0                       // posición, en "niveles", del nivel que se está jugando
    var property contadorDeNiveles = 1

    method iniciar() { // Arranca el generador de ovnis y carga el nivel actual
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
            menu.menuEntreNiveles() // Cuando se da a continuar se inicia el siguiente nivel
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
        menu.menuVictoria()
        self.reiniciar()
    }

    method gameOver() {
        musicaInGame.detener()
        generadorOvnis.detener()
        menu.menuGameOver()
        self.reiniciar()
    }


    method mostrar() {
        const level = new Cartel (image = "lvl.png", position = game.at(0,game.height() -1) )
        game.addVisual(level)
        game.addVisual(contador)
    }


    method configuracionDemo(){ // hardcodeo de el nivel de demostracion.

        
        configuracion.dificultadElegida(1)
        configuracion.tiposNaves().addAll([naveNormal,naveTanque])
        configuracion.cantidadJugadores(2)

        self.contadorDeNiveles(0)
        
        niveles = [nivelDemo]
        indice = 0
        
        
    }

    method iniciarDemo(){

        self.configuracionDemo()

        game.clear()
        musicaMenu.detener()
        // Se inicia el gestor de niveles
        gestorPuntaje.reiniciar()
        gestorPuntaje.mostrar()
        gestorNaves.iniciar()
        self.mostrar()
        musicaInGame.iniciar()
        self.nivelActual().iniciar()
        
    }

}


    object contador inherits Numero {
    override method position() = game.at(2, game.height() - 1)
    override method numero() = gestorNiveles.contadorDeNiveles()
}