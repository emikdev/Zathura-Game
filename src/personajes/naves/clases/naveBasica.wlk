import wollok.game.*
import src.personajes.naves.nave.*
import src.mecanicas.balas.clases.balaNormal.*

// Bala basica del jugador con municion infinita
const balaNormalJugador = new BalaNormal(
  frames = [
    "disparoCeleste-frame1.png",
    "disparoCeleste-frame2.png",
    "disparoCeleste-frame3.png"
  ],
  velocidad = 6,
  dano = 1,
  municion = 99999
)

// Instancia de la nave basica para la demo
const naveBasica = new Nave(
  position = game.at(20, 1),
  vidas = 3,
  framesBase = ["nave.png"],
  framesDisparo = [
    "naveDisparando-frame1.png",
    "naveDisparando-frame2.png"
  ],
  framesMuerte = [
  "muerteBlanco-frame1.png",
  "muerteBlanco-frame2.png",
  "muerteBlanco-frame3.png",
  "muerteBlanco-frame4.png",
  "muerteBlanco-frame5.png"
  ],
  balas = [balaNormalJugador],
  balaActual = 0
)
