import src.mecanicas.animaciones.recursos.recursosDeAnimacion.*

// ==========================================
// ANIMACIONES DE MUERTE COMPARTIDAS
// ==========================================

const animacionMuerteBlanca = new RecursoDeAnimacion(
  frames = ["muerteBlanco-frame1.png", "muerteBlanco-frame2.png", "muerteBlanco-frame3.png", "muerteBlanco-frame4.png", "muerteBlanco-frame5.png", "muerteBlanco-frame6.png", "muerteBlanco-frame7.png"],
  duracion = 400
)

const animacionMuerteAmarilla = new RecursoDeAnimacion(
  frames = ["muerteAmarillo-frame1.png", "muerteAmarillo-frame2.png", "muerteAmarillo-frame3.png", "muerteAmarillo-frame4.png", "muerteAmarillo-frame5.png", "muerteAmarillo-frame6.png", "muerteAmarillo-frame7.png"],
  duracion = 400
)

const animacionMuerteRoja = new RecursoDeAnimacion(
  frames = ["muerteRojo-frame1.png", "muerteRojo-frame2.png", "muerteRojo-frame3.png", "muerteRojo-frame4.png", "muerteRojo-frame5.png", "muerteRojo-frame6.png", "muerteRojo-frame7.png"],
  duracion = 400
)

const animacionMuerteAzul = new RecursoDeAnimacion(
  frames = ["muerteAzul-frame1.png", "muerteAzul-frame2.png", "muerteAzul-frame3.png", "muerteAzul-frame4.png", "muerteAzul-frame5.png", "muerteAzul-frame6.png", "muerteAzul-frame7.png"],
  duracion = 400
)

const animacionMuerteMorada = new RecursoDeAnimacion(
  frames = ["muerteMorado-frame1.png", "muerteMorado-frame2.png", "muerteMorado-frame3.png", "muerteMorado-frame4.png", "muerteMorado-frame5.png", "muerteMorado-frame6.png", "muerteMorado-frame7.png"],
  duracion = 400
)

const animacionMuerteNaranja = new RecursoDeAnimacion(
  frames = ["muerteNaranja-frame1.png", "muerteNaranja-frame2.png", "muerteNaranja-frame3.png", "muerteNaranja-frame4.png", "muerteNaranja-frame5.png", "muerteNaranja-frame6.png", "muerteNaranja-frame7.png"],
  duracion = 400
)

// ==========================================
// NORMALES
// ==========================================

const animacionBaseAlien = new RecursoDeAnimacion(frames = ["alien-frame1.png", "alien-frame2.png"], duracion = 500)
const animacionDisparoAlien = new RecursoDeAnimacion(frames = ["alienDisparando.png"], duracion = 120)
const animacionImpactoAlien = new RecursoDeAnimacion(frames = ["alienImpacto-frame1.png", "alienImpacto-frame2.png", "alienImpacto-frame3.png", "alienImpacto-frame4.png"], duracion = 250)
const animacionMuerteAlien = animacionMuerteBlanca

const animacionBasePulpo = new RecursoDeAnimacion(frames = ["pulpo-frame1.png", "pulpo-frame2.png"], duracion = 500)
const animacionDisparoPulpo = new RecursoDeAnimacion(frames = ["pulpoDisparando.png"], duracion = 120)
const animacionImpactoPulpo = new RecursoDeAnimacion(frames = ["pulpoImpacto-frame1.png", "pulpoImpacto-frame2.png", "pulpoImpacto-frame3.png", "pulpoImpacto-frame4.png"], duracion = 250)
const animacionMuertePulpo = animacionMuerteBlanca

const animacionBaseCalamar = new RecursoDeAnimacion(frames = ["calamar-frame1.png", "calamar-frame2.png"], duracion = 500)
const animacionDisparoCalamar = new RecursoDeAnimacion(frames = ["calamarDisparando.png"], duracion = 120)
const animacionImpactoCalamar = new RecursoDeAnimacion(frames = ["calamarImpacto-frame1.png", "calamarImpacto-frame2.png", "calamarImpacto-frame3.png", "calamarImpacto-frame4.png"], duracion = 250)
const animacionMuerteCalamar = animacionMuerteBlanca

const animacionBaseMosca = new RecursoDeAnimacion(frames = ["mosca-frame1.png", "mosca-frame2.png"], duracion = 400)
const animacionDisparoMosca = new RecursoDeAnimacion(frames = ["moscaDisparando.png"], duracion = 120)
const animacionImpactoMosca = new RecursoDeAnimacion(frames = ["moscaImpacto-frame1.png", "moscaImpacto-frame2.png", "moscaImpacto-frame3.png", "moscaImpacto-frame4.png"], duracion = 250)
const animacionMuerteMosca = animacionMuerteBlanca

const animacionBaseKamikaze = new RecursoDeAnimacion(frames = ["kamikaze-frame1.png", "kamikaze-frame2.png"], duracion = 300)
const animacionDisparoKamikaze = new RecursoDeAnimacion(frames = ["kamikaze-frame1.png"], duracion = 100)
const animacionImpactoKamikaze = new RecursoDeAnimacion(frames = ["kamikazeImpacto-frame1.png", "kamikazeImpacto-frame2.png", "kamikazeImpacto-frame3.png", "kamikazeImpacto-frame4.png"], duracion = 250)
const animacionMuerteKamikaze = animacionMuerteBlanca

const animacionBaseAbeja = new RecursoDeAnimacion(frames = ["abeja-frame1.png", "abeja-frame2.png"], duracion = 400)
const animacionDisparoAbeja = new RecursoDeAnimacion(frames = ["abejaDisparando.png"], duracion = 120)
const animacionImpactoAbeja = new RecursoDeAnimacion(frames = ["abejaImpacto-frame1.png", "abejaImpacto-frame2.png", "abejaImpacto-frame3.png", "abejaImpacto-frame4.png"], duracion = 250)
const animacionMuerteAbeja = animacionMuerteAmarilla

// ==========================================
// HEAVYS
// ==========================================

const animacionBasePulpoHeavy = new RecursoDeAnimacion(frames = ["pulpoHeavy-frame1.png", "pulpoHeavy-frame2.png"], duracion = 600)
const animacionDisparoPulpoHeavy = new RecursoDeAnimacion(frames = ["pulpoHeavyDisparando.png"], duracion = 150)
const animacionImpactoPulpoHeavy = new RecursoDeAnimacion(frames = ["pulpoHeavyImpacto-frame1.png", "pulpoHeavyImpacto-frame2.png", "pulpoHeavyImpacto-frame3.png", "pulpoHeavyImpacto-frame4.png"], duracion = 250)
const animacionMuertePulpoHeavy = animacionMuerteBlanca

const animacionBaseCalamarHeavy = new RecursoDeAnimacion(frames = ["calamarHeavy-frame1.png", "calamarHeavy-frame2.png"], duracion = 600)
const animacionDisparoCalamarHeavy = new RecursoDeAnimacion(frames = ["calamarHeavyDisparando.png"], duracion = 150)
const animacionImpactoCalamarHeavy = new RecursoDeAnimacion(frames = ["calamarHeavyImpacto-frame1.png", "calamarHeavyImpacto-frame2.png", "calamarHeavyImpacto-frame3.png", "calamarHeavyImpacto-frame4.png"], duracion = 250)
const animacionMuerteCalamarHeavy = animacionMuerteBlanca

const animacionBaseAlienHeavy = new RecursoDeAnimacion(frames = ["alienHeavy-frame1.png", "alienHeavy-frame2.png"], duracion = 600)
const animacionDisparoAlienHeavy = new RecursoDeAnimacion(frames = ["alienHeavyDisparando.png"], duracion = 150)
const animacionImpactoAlienHeavy = new RecursoDeAnimacion(frames = ["alienHeavyImpacto-frame1.png", "alienHeavyImpacto-frame2.png", "alienHeavyImpacto-frame3.png", "alienHeavyImpacto-frame4.png"], duracion = 250)
const animacionMuerteAlienHeavy = animacionMuerteBlanca

// ==========================================
// RETROS
// ==========================================

const animacionBasePulpoRojo = new RecursoDeAnimacion(frames = ["pulpoRojo-frame1.png", "pulpoRojo-frame2.png"], duracion = 500)
const animacionDisparoPulpoRojo = new RecursoDeAnimacion(frames = ["pulpoRojoDisparando.png"], duracion = 120)
const animacionImpactoPulpoRojo = new RecursoDeAnimacion(frames = ["pulpoRojoImpacto-frame1.png", "pulpoRojoImpacto-frame2.png", "pulpoRojoImpacto-frame3.png", "pulpoRojoImpacto-frame4.png"], duracion = 250)
const animacionMuertePulpoRojo = animacionMuerteRoja

const animacionBaseCalamarAmarillo = new RecursoDeAnimacion(frames = ["calamarAmarillo-frame1.png", "calamarAmarillo-frame2.png"], duracion = 500)
const animacionDisparoCalamarAmarillo = new RecursoDeAnimacion(frames = ["calamarAmarilloDisparando.png"], duracion = 120)
const animacionImpactoCalamarAmarillo = new RecursoDeAnimacion(frames = ["calamarAmarilloImpacto-frame1.png", "calamarAmarilloImpacto-frame2.png", "calamarAmarilloImpacto-frame3.png", "calamarAmarilloImpacto-frame4.png"], duracion = 250)
const animacionMuerteCalamarAmarillo = animacionMuerteAmarilla

const animacionBaseAlienAzul = new RecursoDeAnimacion(frames = ["alienAzul-frame1.png", "alienAzul-frame2.png"], duracion = 500)
const animacionDisparoAlienAzul = new RecursoDeAnimacion(frames = ["alienAzulDisparando.png"], duracion = 120)
const animacionImpactoAlienAzul = new RecursoDeAnimacion(frames = ["alienAzulImpacto-frame1.png", "alienAzulImpacto-frame2.png", "alienAzulImpacto-frame3.png", "alienAzulImpacto-frame4.png"], duracion = 250)
const animacionMuerteAlienAzul = animacionMuerteAzul

// ==========================================
// ESPECIALES
// ==========================================

const animacionBaseSepia = new RecursoDeAnimacion(frames = ["sepia-frame1.png", "sepia-frame2.png"], duracion = 400)
const animacionDisparoSepia = new RecursoDeAnimacion(frames = ["sepiaDisparando.png"], duracion = 120)
const animacionImpactoSepia = new RecursoDeAnimacion(frames = ["sepiaImpacto-frame1.png", "sepiaImpacto-frame2.png", "sepiaImpacto-frame3.png", "sepiaImpacto-frame4.png"], duracion = 250)
const animacionMuerteSepia = animacionMuerteMorada

const animacionBaseMedusa = new RecursoDeAnimacion(frames = ["medusa-frame1.png", "medusa-frame2.png"], duracion = 400)
const animacionDisparoMedusa = new RecursoDeAnimacion(frames = ["medusaDisparando.png"], duracion = 120)
const animacionImpactoMedusa = new RecursoDeAnimacion(frames = ["medusaImpacto-frame1.png", "medusaImpacto-frame2.png", "medusaImpacto-frame3.png", "medusaImpacto-frame4.png"], duracion = 250)
const animacionMuerteMedusa = animacionMuerteMorada

// ==========================================
// CANGREJOS (JEFES)
// ==========================================

const animacionBaseCangrejoAmarillo = new RecursoDeAnimacion(frames = ["cangrejoAmarillo-frame1.png", "cangrejoAmarillo-frame2.png"], duracion = 250)
const animacionDisparoCangrejoAmarillo = new RecursoDeAnimacion(frames = ["cangrejoAmarilloDisparando.png"], duracion = 150)
const animacionImpactoCangrejoAmarillo = new RecursoDeAnimacion(frames = ["cangrejoAmarilloImpactado-frame1.png", "cangrejoAmarilloImpactado-frame2.png", "cangrejoAmarilloImpactado-frame3.png", "cangrejoAmarilloImpactado-frame4.png"], duracion = 250)
const animacionMuerteCangrejoAmarillo = animacionMuerteAmarilla

const animacionBaseCangrejoAzul = new RecursoDeAnimacion(frames = ["cangrejoAzul-frame1.png", "cangrejoAzul-frame2.png"], duracion = 250)
const animacionDisparoCangrejoAzul = new RecursoDeAnimacion(frames = ["cangrejoAzulDisparando.png"], duracion = 150)
const animacionImpactoCangrejoAzul = new RecursoDeAnimacion(frames = ["cangrejoAzulImpactado-frame1.png", "cangrejoAzulImpactado-frame2.png", "cangrejoAzulImpactado-frame3.png", "cangrejoAzulImpactado-frame4.png"], duracion = 250)
const animacionMuerteCangrejoAzul = animacionMuerteAzul
const animacionBaseCangrejoRojo = new RecursoDeAnimacion(frames = ["cangrejoRojo-frame1.png", "cangrejoRojo-frame2.png"], duracion = 250)
const animacionDisparoCangrejoRojo = new RecursoDeAnimacion(frames = ["cangrejoRojoDisparando.png"], duracion = 150)
const animacionImpactoCangrejoRojo = new RecursoDeAnimacion(frames = ["cangrejoRojoImpactado-frame1.png", "cangrejoRojoImpactado-frame2.png", "cangrejoRojoImpactado-frame3.png", "cangrejoRojoImpactado-frame4.png"], duracion = 250)
const animacionMuerteCangrejoRojo = animacionMuerteRoja
// ==========================================
// OVNIS
// ==========================================
const animacionBaseOvniClasico = new RecursoDeAnimacion(frames = ["ovni.png"], duracion = 500)
const animacionDisparoOvniClasico = new RecursoDeAnimacion(frames = ["ovni.png"], duracion = 100)
const animacionImpactoOvniClasico = new RecursoDeAnimacion(frames = ["ovniImpacto-frame1.png", "ovniImpacto-frame2.png", "ovniImpacto-frame3.png", "ovniImpacto-frame4.png"], duracion = 250)
const animacionMuerteOvniClasico = animacionMuerteNaranja