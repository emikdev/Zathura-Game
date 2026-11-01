class Arsenal{
    const armas
    var armaActual = 0

    method armaActual(){ // Devuelve el arma actual
        return armas.get(armaActual)
    }

    method agregarAlArma(nuevaArma){ // Agrega un arma al armas
        armas.add(nuevaArma)
    }
    
    method agregarArmasIniciales(listaDeArmas){
        listaDeArmas.forEach{ arma => armas.add(arma) }
    }

    method equiparSiguienteArma(){ // Devuelve el siguiente arma en armas, si llega al final vuelve al primer arma
        armaActual = (armaActual + 1) % armas.size()
    }

    method verificarArmaActual(){ // Revisa si el arma actual tiene municion, sino tiene la descarta y vuelve al primer arma
        if (not self.armaActual().hayMunicion()){
            armas.remove(armaActual)
            armaActual = 0 
        }
    }

}
