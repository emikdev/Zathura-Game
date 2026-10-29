import wollok.game.*

class Nivel{

    const formaciones // lista de formaciones pre diseñadas
    
    method initialize(){

        self.formacionActual().iniciar() // Se carga la formacion actual de la lista de formaciones

    }

    method formacionActual(){ // La formacion actual siempre es la primera de la lista

        return formaciones.first() 

    }

    method siguienteFormacion(){ // Remueve la formacion actual de la lista

        formaciones.remove(self.formacionActual())

    }


    method llamarSiguienteFormacionSiSePuede(){
        self.siguienteFormacion()
        if(self.haySiguienteFormacion()){
            self.formacionActual().iniciar()
        }
    }

    method haySiguienteFormacion(){ // Verifica que formaciones no este vacia

        return not formaciones.isEmpty()
    
    }

    method enemigosGanaron(){ // Si la formacion llego a y = 0 el juego termina

        if(self.formacionActual().enemigosEnFormacion().any({ enemigo => enemigo.position().y() == 0 })){
            self.nivelTerminado()
        }

    }

    method nivelTerminado(){}


}