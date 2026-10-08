// Registro global de proyectiles enemigos activos
object gestorDisparosEnemigos {

  // Disparos enemigos que actualmente existen en pantalla
  var disparosActivos = []

  // Valor por defecto
  var limite = 2


  // Indica si se puede registrar un nuevo disparo enemigo
  method puedeDisparar() {

    return disparosActivos.size() < limite

  }


  // Registra un nuevo disparo enemigo
  method registrarDisparo(disparo) {

    if (not disparosActivos.any({ registrado => registrado == disparo })) {

      disparosActivos.add(disparo)

    }

  }


  // Elimina un disparo del registro
  method liberarDisparo(disparo) {

    disparosActivos = disparosActivos.filter({ registrado =>

      registrado != disparo

    })

  }


  // Devuelve la cantidad de disparos enemigos activos
  method cantidadDisparos() {

    return disparosActivos.size()

  }


  // Configura la cantidad maxima de disparos
  // que pueden existir simultaneamente
  method configurarLimite(nuevoLimite) {

    limite = nuevoLimite

  }

}