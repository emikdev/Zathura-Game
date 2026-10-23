import src.mecanicas.animaciones.recursosDeAnimacion.*

// Los recursos de animacion son recursos que llama el tipo de animacion al instanciarse

const animacionBase = new RecursosDeAnimacion(
    frames = ["nave.png"],
    duracion = 1000
)

const animacionDisparo = new RecursosDeAnimacion(
    frames = ["naveDisparando-frame1.png", "naveDisparando-frame2.png"],
    duracion = 1000
)

const animacionImpactado = new RecursosDeAnimacion(
    frames = ["muerteNave-frame1.png", "muerteNave-frame2.png", "muerteNave-frame3.png", "muerteNave-frame4.png", "muerteNave-frame5.png", "muerteNave-frame6.png", "muerteNave-frame7.png"],
    duracion = 1000
)

/* 

    Me encontre con el problema de que necesitaba que la animacion conozca su estado asi que 
    la hice una clase para al instanciarse se le de el estado, los recursos de animacion
    son los frames y duracion que tiene que usar, ejemplo al instanciar.

    new animacionDisparo(
        estado = self, 
        frames = animacionDisparo.frames(), 
        duracion = animacionDisparo.duracion()
    )

    Despues la animacion se empieza a ejecutar sola cuando se instanciay al terminar hace el 
    cambio de estado.

*/