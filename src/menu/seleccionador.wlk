import src.mapas.mapaDemo.*
import src.personajes.naves.clases.naveBasica.*

class Seleccionador {
    const property image = "spot.png"
    const property opciones
    const alSeleccionar
    var indice = 0

    method seleccionado() = opciones.get(indice)
    method position() = self.seleccionado().position().up(4)

    method siguiente() { indice = (indice + 1) % opciones.size() }
    method anterior() { indice = (indice - 1 + opciones.size()) % opciones.size() }

    method selecciona() { alSeleccionar.apply(self.seleccionado()) }
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
