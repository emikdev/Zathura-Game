import src.mecanicas.gestores.gestorNiveles.*

import wollok.game.*

class Nivel{

    const formaciones // lista de formaciones pre diseñadas
    
    method initialize(){
        gestorNiveles.agregarNivel(self)
    }

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

    method nivelTerminado(){ // Nivel terminado llama a gestorNivel.terminarNivel()
        gestorNiveles.terminarNivel()
    }
}