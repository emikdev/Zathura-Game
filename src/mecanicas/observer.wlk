
// este es el observer encargado de manejar la cantidad de balas que haya en el tablero actualmente segun la dificultad de nivel, la cantidad permitida puede aumentar

object observerDisparosEnemigos {

    var balasActivas = 0                        // balas que estan en el tablero.

    method actualizarBalas( valor ) {

        balasActivas =+ valor                   // valor depende de si la bala se destruyo o acaba de ser instanciada por una nave enemiga, siendo asi -1 o 1.
      
    }

    method puedeDisparar(numeroDificultad) {          // la cantidad de balas que puede haber segun la dificultad.
      
        balasActivas < numeroDificultad*2               // 1 = facil , 2 = medio , 3 = dificil 
    }

}