import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*
import src.mecanicas.animaciones.recursos.recursosArmas.*

// Cada bufo toma automáticamente el primer frame del recurso de su arma
const bufoLaserRecursos = new RecursoDeAnimacion(
    frames = ["buf_ArmaLaser.png"]
)

const bufoPlasmaRecursos = new RecursoDeAnimacion(
    frames = ["buf_ArmaPlasma.png"]
)

const bufoDobleCanonRecursos = new RecursoDeAnimacion(
    frames = ["buf_ArmaDoble.png"]
)

const bufoTripleCanonRecursos = new RecursoDeAnimacion(
    frames = ["buf_ArmaTriple.png"]
)

const bufoVidaRecursos = new RecursoDeAnimacion(
    frames = [ "bufo_vida.png" ]
)