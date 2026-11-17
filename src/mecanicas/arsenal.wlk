class Arsenal {
    const armas = []
    var armaActual = 0

    method armaActual() { // Devuelve el arma actual
        return armas.get(armaActual)
    }
    
    method agregarArma(nuevaArma) { // Agrega un arma a armas
        if (not armas.contains(nuevaArma)) {
            armas.add(nuevaArma)
        }
    }

    method seleccionarArma(slot) {
        if (slot.between(0, armas.size() - 1)) {
            armaActual = slot
        }
    }

    method equiparSiguienteArma() { // Devuelve el siguiente arma en armas, si llega al final vuelve al primer arma
        armaActual = (armaActual + 1) % armas.size()
    }

    method verificarArmaActual() { // Revisa si el arma actual tiene municion, sino tiene la descarta y vuelve al primer arma
        if (not self.armaActual().hayMunicion()) {
            armas.remove(self.armaActual())
            armaActual = 0 
        }
    }
}
