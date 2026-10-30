import game.*
import src.mecanicas.direcciones.movimientos.*

object arriba{
    method siguiente(position) = mover.moverSiSePuede(position.up(1))
}

object abajo{
    method siguiente(position) = mover.moverSiSePuede(position.down(1))
}

object derecha{
    method siguiente(position) = mover.moverSiSePuede(position.right(1))
}

object izquierda{
    method siguiente(position) = mover.moverSiSePuede(position.left(1))
}