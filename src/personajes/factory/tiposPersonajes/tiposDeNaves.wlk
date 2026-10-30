object naveTanque {
  
  method hp() = 200

  method vidas() = 5

  method framesBase()  = ["naveTankFrame-1.png","naveTankFrame-2.png"]

  method framesDisparo() = ["naveTankDisparoFrame-1.png","naveTankDisparoFrame-2.png"]

  method framesMuerte() = ["naveTankMuerteFrame-1.png","naveTankMuerteFrame-1.png"]

  method framesImpacto() = ["naveTankImpactoFrame-1.png","naveTankImpactoFrame-2.png"]

  method arsenal() = [armaNormal()]
}
object naveAtaque {

  method hp() = 80

  method vidas() = 2

  method framesBase()  = ["naveAtaqueFrame-1.png","naveAtaqueFrame-2.png"]

  method framesDisparo()  = ["naveAtaqueDisparandoFrame-1.png","naveAtaqueDisparandoFrame-2.png"]

  method framesMuerte() = ["naveAtaqueMuerteFrame-1.png","naveAtaqueMuerteFrame-1.png"]

  method framesImpacto() = ["naveAtaqueImpactoFrame-1.png","naveAtaqueImpactoFrame-1.png"]

  method arsenal() = [armaNormal(), armaRapida(), armaPesada()]

}

object nave {

  method hp () = 100

  method vidas() = 3

  method framesBase()  = ["naveFrame-1.png","naveFrame-2.png"]

  method framesDisparo() = ["naveDisparoFrame-1.png","naveDisparoFrame-2.png"]

  method framesMuerte() = ["naveMuerteFrame-1.png","naveMuerteFrame-1.png"]

  method framesImpacto() = ["naveImpactoFrame-1.png","naveImpactoFrame-2.png"]

  method arsenal() = [armaNormal(), armaPesada()]
  
}