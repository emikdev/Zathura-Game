# 🚀 Zathura Game

Proyecto de la materia **Objetos 1** (UNQ). Consiste en el desarrollo del juego **Zathura**, implementado en su totalidad con el lenguaje y framework **Wollok**.

## Descripción

Zathura Game es un videojuego de disparos en el espacio, estilo arcade clásico (Space Invaders / Galaga). Enfrentate a oleadas implacables de alienígenas 👾, elegí tu nave para definir tu estrategia, cada una contara con un arsenal de armas distintas, demuestra tus habilidades de Gamer 🕹️ para alcanzar la victoria absoluta🏅.

## Sistema De Niveles

Sistema de Oleadas y Niveles: Progresión dinámica a través de niveles con dificultad creciente hasta llegar al enfrentamiento final.

Modo Cooperativo / Multijugador: Compatible para 1 o 2 jugadores simultáneos en pantalla. Tené en cuenta que en caso de jugar de dos, la dificultad sera mayor!⚠️⚠️⚠️

Sistema de Puntuación: Destruye diferentes tipos de enemigos (Básicos, Especiales, Heavys y el escurridizo OVNI de bonificación) para sumar puntos y batir récords.

## Tecnologías

- **Wollok** (Wollok Game)

## Estructura del proyecto

```
assets/
├── enemigos/       # Sprites y animaciones de cada tipo de enemigo
├── naves/          # Sprites y animaciones de la/s nave/s del jugador
├── ovnis/          # Sprites y animaciones de los ovnis
└── recursos/        # Disparos y muertes genéricos reutilizables

src/
├── mapas/                    # Diseño y carga de niveles
└── personajes/
    ├── mecanicas/            # Herramientas reutilizables (disparos, direcciones, randomizer, etc.)
    ├── enemigos/             # Clase base y subclases de enemigos
    ├── naves/                # Clase base y subclases de naves
    └── ovnis/                # Clase base y subclases de ovnis

test/
├── testGeneral/       # Tests de integración / casos generales
└── testUnitarios/     # Tests unitarios de cada componente

Zathura-Game.wpgm       # Programa principal del juego
```

## Cómo ejecutar

1. Abrir el proyecto en **Wollok IDE**.
2. Ejecutar el programa `Zathura-Game.wpgm`.

## Cómo correr los tests

1. Abrir el proyecto en **Wollok IDE**.
2. Ejecutar los tests ubicados en `test/testGeneral` y `test/testUnitarios`.

## Integrantes

- Muñoz Damian (emikdev)
- Marcos Correia (Marcos-Correia17)
- Joaquin Paniagua (joaquinjesus1234)
- Nahuel Romero (NRomeroDev)

## Estado

Proyecto en desarrollo.