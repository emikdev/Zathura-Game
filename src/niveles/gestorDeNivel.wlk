import game.*

object gestorDeNiveles{

    const niveles = []
    
    method initialize(){ // Al iniciar carga el primer nivel de la lista
        self.nivelActual().cargar()
    }

    method agregarNiveles(nuevosNiveles){ // Agrega los niveles
        niveles.addAll(nuevosNiveles)
    }

    method nivelActual(){ // Devuelve el nivel de la primera posicion de la lista
        return niveles.first()
    }

    method removerNivelActual(){ // Remueve el nivel de la primera posicion de la lista
        niveles.remove({self.nivelActual()})
    }

    method terminarNivel(){ // Metodo llamado por nivel

        self.removerNivelActual() 
    
        if(not self.haySiguienteNivel()){ // Si no hay siguiente nivel gana
            // Ganar
        }

        // TODO: Cartel de pasar a siguiente nivel 
        game.schedule(5000, { // Si hay siguiente nivel se carga tras 5 segundos
            
            self.nivelActual().cargar()    
        })
        
    }

    method haySiguienteNivel(){ // Devuelve si hay siguiente nivel
        return niveles.isEmpty()
    }

    method gameOver(){ 
        // Termina el juego en derrota 
    }
}