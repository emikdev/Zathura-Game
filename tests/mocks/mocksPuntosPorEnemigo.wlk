// Mock de formación: registra a quién le pidieron quitar y entiende los mensajes del Enemigo
const formacionMock = object {
  const property quitados = []
  
  method quitar(enemigo) { quitados.add(enemigo) }
  
  method olvidarEnemigoLibre(enemigo) { }
}