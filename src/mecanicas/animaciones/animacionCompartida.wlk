import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*

object animacionesCompartidas {
  const recursos = new Dictionary()

  method obtener(frames, duracion) {
    const clave = frames.toString() + "_" + duracion.toString()
    if (!recursos.containsKey(clave)) {
      recursos.put(clave, new RecursoDeAnimacion(frames = frames, duracion = duracion))
    }
    return recursos.get(clave)
  }
}
