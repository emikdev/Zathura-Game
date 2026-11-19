 import src.menu.menu.*
import src.sonidos.musicaMenu.*
import src.sonidos.sonido.*
import src.menu.seleccionador.*
import src.menu.configuracion.*
import src.menu.menus.menuDificultad.*
 
 object menuUnJugador  {

    method iniciarMenu() {
      menu.elegirNave("elegiTuNave.png", { tipoNaveP1 =>
        configuracion.tiposNaves().add(tipoNaveP1)
        menuDificultad.iniciarMenu()
      })
    }

 }