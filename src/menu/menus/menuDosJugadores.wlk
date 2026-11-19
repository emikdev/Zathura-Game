import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.menu.menus.menuDificultad.*

object menuDosJugadores{

    method iniciarMenu() {
      menu.elegirNave("jugador1ElegiTuNave.png", { tipoNaveP1 =>
        configuracion.tiposNaves().add(tipoNaveP1)

        menu.elegirNave("jugador2ElegiTuNave.png", { tipoNaveP2 =>
          configuracion.tiposNaves().add(tipoNaveP2)

         menuDificultad.iniciarMenu()
        })
      })
    }

}