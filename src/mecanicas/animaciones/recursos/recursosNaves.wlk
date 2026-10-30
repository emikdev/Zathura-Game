import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*

// Los recursos de animacion son recursos que llama el tipo de animacion al instanciarse

// Nave Tanque
const animacionNaveTanqueBase = new RecursoDeAnimacion(
    frames = ["naveTankFrame-1.png", "naveTankFrame-2.png"]
)


// Nave Ataque
const animacionNaveAtaqueBase = new RecursoDeAnimacion(
    frames = ["naveAtaqueFrame-1.png", "naveAtaqueFrame-2.png"]
)

// Nave Estándar
const animacionNaveEstandarBase = new RecursoDeAnimacion(
    frames = ["nave.png"]
)
