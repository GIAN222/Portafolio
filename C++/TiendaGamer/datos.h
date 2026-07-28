#pragma once
#include <vector>
#include "juego.h" // Necesitamos saber qué es un "Juego"

// Solo declaramos la función.
// "Oye programa, prometo que en otro lado habrá una función llamada cargarJuegos"
void cargarJuegos(std::vector<Juego *> &biblioteca);