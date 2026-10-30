import src.niveles.gestorDeNivel.gestorDeNiveles

import wollok.game.*

class Nivel{

    const formaciones // lista de formaciones pre diseñadas
    const gestorDeNivel = gestorDeNiveles // Conoce su gestor ya que lo llama para terminar el nivel
    
    method cargar(){

        self.formacionActual().iniciar() // Se carga la formacion actual de la lista de formaciones

    }

    method formacionActual(){ // La formacion actual siempre es la primera de la lista

        return formaciones.first() 

    }

    method removerFormacion(){ // Remueve la primera formacion de la lista 

        formaciones.remove(self.formacionActual())

    }


    method llamarSiguienteFormacionSiSePuede(){
        self.removerFormacion() 
        if(not self.haySiguienteFormacion()){  // Si no hay siguiente formacion da por finalizado el nivel
            self.nivelTerminado()
        }
        self.formacionActual().iniciar()
        
    }

    method haySiguienteFormacion(){ // Verifica que formaciones no este vacia

        return not formaciones.isEmpty()
    
    }

    method enemigosGanaron(){ // Si la formacion llego a y = 0 el juego termina

        if(self.formacionActual().enemigosEnFormacion().any({ enemigo => enemigo.position().y() == 0 })){
            gestorDeNivel.gameOver()
        }

    }

    method nivelTerminado(){ // Nivel terminado llama a gestorNivel.terminarNivel()
        gestorDeNivel.terminarNivel()
    }
}