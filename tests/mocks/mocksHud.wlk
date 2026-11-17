// Nave mínima para el HUD: lo único que le piden los visuales es vidas(), iconoArmaActual() y municionActual().
// Cada atributo es "property", así los tests pueden cambiarlos para comprobar que el HUD se actualiza.
class NaveMock {
  var property vidas = 3
  var property iconoArmaActual = "arma.png"
  var property municionActual = 0
}