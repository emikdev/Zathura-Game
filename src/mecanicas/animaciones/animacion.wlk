class Animacion {

    const estado
    const recursoDeAnimacion
    var frameActual = 0
    var activa = true

    method initialize() {
        self.animar()
    }

    method frameActual() = recursoDeAnimacion.frames().get(frameActual)

    method animar() {
        game.schedule(recursoDeAnimacion.duracion() / recursoDeAnimacion.frames().size(), {
            if (activa) {
                if (frameActual < recursoDeAnimacion.frames().size() - 1) {
                    frameActual += 1
                    self.animar()
                } else {
                    estado.terminoAnimacion()
                }
            }
        })
    }

    method reiniciar() {
        frameActual = 0
        self.animar()
    }

    method detener() {
        activa = false
    }

}