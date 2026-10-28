class Arsenal{
    const arsenal
    var armaActual = 0

    method armaActual(){ // Devuelve el arma actual
        return arsenal.get(armaActual)
    }

    method agregarAlArsenal(nuevaArma){ // Agrega un arma al arsenal
        arsenal.add(nuevaArma)
    }
    
    method equiparSiguienteArma(){ // Devuelve el siguiente arma en el arsenal, si llega al final vuelve al primer arma
        armaActual = (armaActual + 1) % arsenal.size()
    }

    method equiparArma(seleccionarSlot){ // Seleccion un slot del arsenal
        armaActual = seleccionarSlot
    }

    method verificarArmaActual(){ // Revisa si el arma actual tiene municion, sino tiene la descarta y vuelve al primer arma
        if (not self.armaActual().hayMunicion()){
            arsenal.remove(armaActual)
            armaActual = 0 
        }
    }

}