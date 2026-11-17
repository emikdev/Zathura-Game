class RecursoDeAnimacion {
  const frames
  const duracion = 500

  method frames() = frames
  method duracion() = duracion
  method tiempoPorFrame() = duracion / frames.size()
}
