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

object gestorNiveles {
    const nivelesDelJuego = [nivelUno, nivelDos, nivelTres, nivelCuatro] 
    var niveles = nivelesDelJuego        
    var indice = 0                       
    var property contadorDeNiveles = 1

    method iniciar() { 
        game.boardGround("fondo.png")
        self.nivelActual().iniciar()
        gestorNaves.iniciar()
    }

    method nivelActual() = niveles.get(indice)
    method haySiguienteNivel() = indice < niveles.size() - 1

    method terminarNivel() { 
        if (self.haySiguienteNivel()) {
            indice += 1
            musicaInGame.detener()
            contadorDeNiveles += 1
            
            reloj.limpiarTodo() // Limpiamos el nivel recién terminado
            
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

    method ganar() {
        musicaInGame.detener()
        musicaVictoria.iniciar()
        gestorOvnis.detener()
        
        reloj.limpiarTodo() // Limpiamos la partida
        self.reiniciar()    // Volvemos al nivel 1
        
        victoria.iniciarMenu()
    }

    method gameOver() {
        musicaInGame.detener()
        gestorOvnis.detener()
        
        reloj.limpiarTodo()
        self.reiniciar()
        
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