import wollok.game.*
import src.personajes.factory.factory.*
import src.niveles.formacion.*          // ajustá las rutas a las tuyas

// Plano de una formación: se materializa cuando empieza.
class Oleada {

  const intervalo        // ms entre pasos de la formación
  const disposicion      // lista de pares [tipo, posicion]

  method iniciar(nivel){
    const formacion = new Formacion(nivel = nivel, intervalo = intervalo)
    
    disposicion.forEach({ celda =>
      const enemigo = factory.crearEnemigo(celda.first(), formacion, celda.last())
      formacion.agregar(enemigo)
      game.addVisual(enemigo)
    })

    formacion.iniciar()
  }

}

// Ayuda para no escribir cada enemigo a mano
object disposiciones {

  method fila(tipo, y, desdeX, cantidad, separacion) {
    return (0..cantidad - 1).map({ i => [tipo, game.at(desdeX + i * separacion, y)] })
  }

}