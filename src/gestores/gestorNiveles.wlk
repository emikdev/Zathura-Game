import src.sonidos.musicaMenu.*
import wollok.game.*
import src.niveles.niveles.*
<<<<<<< HEAD:src/gestores/gestorNiveles.wlk
import src.gestores.gestorOvnis.*
import src.gestores.gestorNaves.*
import src.menu.menu.*
=======
import src.mecanicas.gestores.generadorOvnis.*
import src.mecanicas.gestores.gestorNaves.*
import src.menu.menus.menuEntreNiveles.*
import src.menu.menus.menuVictoria.*
import src.menu.menus.menuGameOver.*
>>>>>>> 2b75fee859cbc0c1f89b312c23eeac75265babe9:src/mecanicas/gestores/gestorNiveles.wlk
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
<<<<<<< HEAD:src/gestores/gestorNiveles.wlk
            reloj.limpiarTodo() 
            menu.menuEntreNiveles() 
=======
            entreNiveles.iniciarMenu() // Cuando se da a continuar se inicia el siguiente nivel
>>>>>>> 2b75fee859cbc0c1f89b312c23eeac75265babe9:src/mecanicas/gestores/gestorNiveles.wlk
            contadorDeNiveles += 1
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
<<<<<<< HEAD:src/gestores/gestorNiveles.wlk
        gestorOvnis.detener()
        reloj.limpiarTodo()
        menu.menuVictoria()
=======
        generadorOvnis.detener()
        victoria.iniciarMenu()
>>>>>>> 2b75fee859cbc0c1f89b312c23eeac75265babe9:src/mecanicas/gestores/gestorNiveles.wlk
        self.reiniciar()
    }

    method gameOver() {
        musicaInGame.detener()
<<<<<<< HEAD:src/gestores/gestorNiveles.wlk
        gestorOvnis.detener()
        reloj.limpiarTodo()
        menu.menuGameOver()
=======
        generadorOvnis.detener()
        gameOver.iniciarMenu()
>>>>>>> 2b75fee859cbc0c1f89b312c23eeac75265babe9:src/mecanicas/gestores/gestorNiveles.wlk
        self.reiniciar()
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