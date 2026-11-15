object gestorMuros{
    var muros = []

    method iniciar(){
        muros = configuracion.muros()
    }

    method muroDestruido(muro){
        muros.remove(muro)
        // Ejecutar sonido, tambien podriamos bajar el puntaje
    }
}