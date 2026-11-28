import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
import src.gestores.gestorOvnis.*
import src.gestores.gestorNaves.*
import src.menu.menu.*
import src.menu.menus.menuEntreNiveles.*
import src.menu.menus.menuVictoria.*
import src.menu.menus.menuGameOver.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.personajes.factory.tiposPersonajes.tiposDeNaves.*
import src.gestores.gestorDePuntos.*
import src.gestores.reloj.*
import src.mecanicas.gestores.gestorBufos.*

object gestorNiveles {
    const nivelesDelJuego = [nivelUno, nivelDos, nivelTres, nivelCuatro] 
    var niveles = nivelesDelJuego        
    var indice = 0                       
    var property contadorDeNiveles = 1

    method iniciarJuego() { 
        game.boardGround("fondo.png")
        gestorNaves.iniciar() 
        self.iniciarNivelActual()
    }

    method iniciarNivelActual() {
        self.nivelActual().iniciar()
        gestorPuntaje.mostrar()
         gestorBufos.iniciar()
        self.mostrar()
        
        musicaInGame.iniciar() // <--- ARRANCAMOS LA MÚSICA ACÁ
    }

    method nivelActual() = niveles.get(indice)
    method haySiguienteNivel() = indice < niveles.size() - 1

    method terminarNivel() { 
        if (self.haySiguienteNivel()) {
            indice += 1
            musicaInGame.detener() // Detiene la música para el menú
            contadorDeNiveles += 1
            entreNiveles.iniciarMenu() 
        } else {
            self.ganar()
        }
    }

    method reiniciar() {
        niveles = nivelesDelJuego
        indice = 0
        contadorDeNiveles = 1
    }

    method limpiarPartida() {
        musicaInGame.detener()
        gestorOvnis.detener()
        reloj.limpiarTodo()
        self.reiniciar()
    }

    method ganar() {
        self.limpiarPartida()
        musicaVictoria.iniciar()
        victoria.iniciarMenu()
    }

    method gameOver() {
        self.limpiarPartida()
        gameOver.iniciarMenu()
    }

    method hayEnemigoEn(posicion, disparo) {
        self.nivelActual().hayEnemigoEn(posicion, disparo)
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