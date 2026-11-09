class Arsenal{
    const armas = []
    var armaActual = 0

    method armaActual(){ // Devuelve el arma actual
        return armas.get(armaActual)
    }

    method agregarAArmas(nuevaArma){ // Agrega un arma a armas
        armas.add(nuevaArma)
    }

    method equiparSiguienteArma(){ // Devuelve el siguiente arma en armas, si llega al final vuelve al primer arma
        armaActual = (armaActual + 1) % armas.size()
    }

    method verificarArmaActual(){ // Revisa si el arma actual tiene municion, sino tiene la descarta y vuelve al primer arma
        if (not self.armaActual().hayMunicion()){
            armas.remove(self.armaActual())
            armaActual = 0 
        }
    }

}
