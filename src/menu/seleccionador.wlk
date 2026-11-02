import wollok.game.*
class Seleccionador {
    const property image = "spot.png"
    const property opciones
    const alSeleccionar
    const alturaFlecha
    const anchoFlecha       // anchoFlecha hace referencia al movimiento hacia los lados no al ancho de la visual.
    var indice = 0

    method seleccionado() = opciones.get(indice)
    method position() = self.seleccionado().position().up(alturaFlecha).left(anchoFlecha)

    method siguiente() { indice = (indice + 1) % opciones.size() }
    method anterior() { indice = (indice - 1 + opciones.size()) % opciones.size() }

    method selecciona() { alSeleccionar.apply(self.seleccionado()) }

    method controles() {
    
      keyboard.left().onPressDo({ self.anterior() })
      keyboard.right().onPressDo({ self.siguiente() })
      keyboard.a().onPressDo({ self.anterior() })
      keyboard.d().onPressDo({ self.siguiente() })
      keyboard.space().onPressDo({ self.selecciona() })
    }
}

class Aspecto {
    const property image
    const property position
}

class Cartel {
    const property image
    const property position
}

class Opcion {
    const property image
    const property position
    const property valor
}
