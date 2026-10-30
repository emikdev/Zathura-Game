class Arsenal{
    const armas
    var armaActual = 0

    method armaActual(){ // Devuelve el arma actual
        return armas.get(armaActual)
    }

    method agregarAlArmas(nuevaArma){ // Agrega un arma al armas
        armas.add(nuevaArma)
    }
    
    method equiparSiguienteArma(){ // Devuelve el siguiente arma en armas, si llega al final vuelve al primer arma
        armaActual = (armaActual + 1) % armas.size()
    }

    method equiparArma(seleccionarSlot){ // Seleccion un slot del armas
        armaActual = seleccionarSlot.min(armas.size() - 1) // Evita que se desfase indice armaActual
    }

    method verificarArmaActual(){ // Revisa si el arma actual tiene municion, sino tiene la descarta y vuelve al primer arma
        if (not self.armaActual().hayMunicion()){
            armas.remove(armaActual)
            armaActual = 0 
        }
    }

}
