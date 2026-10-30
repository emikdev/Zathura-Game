import src.mecanicas.animaciones.recursos.recursosNaves.*
import src.mecanicas.animaciones.recursos.recursosProyectiles.*
import src.mecanicas.animaciones.recursos.recursosDeMuertes.*
import src.mecanicas.arsenal.*

object naveTanque {
  
  method hp() = 200

  method vidas() = 5

  method framesBase()  = animacionNaveTanqueBase

  method framesDisparo() = animacionNaveTanqueDisparo

  method framesMuerte() = animacionNaveTanqueMuerte

  method arsenal() = new Arsenal(aramas =[armaNormal()])
}
object naveAtaque {

  method hp() = 80

  method vidas() = 2

  method framesBase()  = animacionNaveAtaqueBase

  method framesDisparo()  = animacionNaveAtaqueDisparo

  method framesMuerte() = animacionNaveAtaqueMuerte

  method arsenal() = new Arsenal(aramas =[armaNormal(), armaRapida(), armaPesada()])

}

object nave {

  method hp () = 100

  method vidas() = 3

  method framesBase()  = animacionNaveEstandarBase

  method framesDisparo() = animacionNaveEstandarDisparo

  method framesMuerte() = animacionNaveEstandarMuerte

  method arsenal() = new Arsenal(aramas = [armaNormal(), armaPesada()])
  
}