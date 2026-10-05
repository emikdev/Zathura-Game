import enemigo.*


class FactoryEnemigos{

    method crearEnemigo(tipo, nuevaPosition){

        /* 
        
            Se espera que tipo sea el tipo de alien que se desea usar, y nueva Position espera
            un archivo de tipo position.

            A pesar de que esto seria optimo hacerlo con un switch en Wollok no hay dicha 
            herramienta
        
            El funcionamiento es sencillo, se le pasa al metodo crearEnemigo los parametros
            necesarios y instancia un objeto pre configurado, ante la necesidad de agregar
            mas enemigos se hace uso de otro if. 

            Si se pasa un tipo de enemigo inexistente no hace nada por la falta de caso default.

            Obs: Para sistema de pesos para instanciar un enemigo heavy de manera aleatoria, 
            se podria evaluar en el if si un numero que se genera al azar cae entre siertos
            valores, los cuales determinen si va a ser un alien comun o un heavy por ejemplo.

        */

        if(tipo == "alien"){ // Se evalua el tipo de enemigo

            const alien = new Enemigo( // Se instancia un objeto pre moldeado

                position = nuevaPosition,
                hp = 1,
                bala = 0,
                framesBase = ["alien-frame1.png", "alien-frame2.png"],
                framesMuerte = []

            )
        }

        if(tipo == "calamar"){
            
            const calamar = new Enemigo(

                position = nuevaPosition,
                hp = 1,
                bala = 0,
                framesBase = ["calamar-frame1.png", "calamar-frame2.png"],
                framesMuerte = []

            )

        }

        if(tipo == "pulpo"){
            
            const pulpo = new Enemigo(

                position = nuevaPosition,
                hp = 1,
                bala = 0,
                framesBase = ["pulpo-frame1.png", "pulpo-frame2.png"],
                framesMuerte = []

            )

        }


    }

}