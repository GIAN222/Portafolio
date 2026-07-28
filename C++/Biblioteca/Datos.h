#pragma once
#include <vector>
#include "Libro.h" // Necesitamos saber qué es un "Libro"

// Solo declaramos la función.
// "Oye programa, prometo que en otro lado habrá una función llamada cargarLibros"
void cargarLibros(std::vector<Libro *> &biblioteca);