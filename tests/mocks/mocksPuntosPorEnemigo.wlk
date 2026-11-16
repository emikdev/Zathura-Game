  // Mock de formación: solo registra a quién le pidieron quitar
  const formacionMock = object {
    const property quitados = []
    method quitar(enemigo) { quitados.add(enemigo) }
  }
