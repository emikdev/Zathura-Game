class Estado {
  
  	// lo que cambia en cada estado
	method frames(nave)
	method duracionFrame() = 100	
	method alTerminar(nave) { }   // por defecto no hace nada, cada estado va hacer algo distinto
    method estaMuerta() = false
    method puedeDisparar() = false
    
}
