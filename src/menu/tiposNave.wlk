object naveTanque {
  method imagen() = "naveNautilus.png"

  method hp() = 10

  method framesBase()  = ["naveTankFrame-1.png","naveTankFrame-2.png"]

  method framesMuerte() = ["naveTankMuerteFrame-1.png","naveTankMuerteFrame-1.png"]

  method armas() = [armaNormal()]
}

object naveAtaque {

  method hp() = 3

  method framesBase()  = ["naveAtaqueFrame-1.png","naveAtaqueFrame-2.png"]

  method framesMuerte() = ["naveAtaqueMuerteFrame-1.png","naveAtaqueMuerteFrame-1.png"]

  method armas() = [armaNormal(), armaRapida(), armaPesada()]
}

object nave {

  method image() = "nave.png"

  method hp() = 5

  method framesBase()  = ["naveFrame-1.png","naveFrame-2.png"]

  method framesMuerte() = ["naveMuerteFrame-1.png","naveMuerteFrame-1.png"]

  method arma() = [armaNormal(), armaPesada()]
  
}