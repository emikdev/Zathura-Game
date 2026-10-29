import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*

// Los recursos de animacion son recursos que llama el tipo de animacion al instanciarse


const animacionBase = new RecursosDeAnimacion(
    frames = ["nave.png"]
)


const animacionDisparo = new RecursosDeAnimacion(
    frames = ["naveDisparando-frame1.png", "naveDisparando-frame2.png"]
)

const animacionMuerte = new RecursosDeAnimacion(
    frames = ["muerteNave-frame1.png", "muerteNave-frame2.png", "muerteNave-frame3.png", "muerteNave-frame4.png", "muerteNave-frame5.png", "muerteNave-frame6.png", "muerteNave-frame7.png"]
)
