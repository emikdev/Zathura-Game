import src.mecanicas.bandos.*

// Define qué datos de configuración responde cualquier tipo de personaje.
// El personaje le pregunta a su tipo; los valores por defecto cubren lo común.
class TipoPersonaje {

  method hp() = 1
  method vidas() = 1

  method framesBase()
  method framesMuerte()
  // TODO: reemplazar cuando existan los recursos de disparo e impacto
  method framesDisparo() = self.framesBase()
  method framesImpacto() = self.framesBase()

  method bando()
  method arsenal()

}