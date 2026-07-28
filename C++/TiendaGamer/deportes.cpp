#include "deportes.h"
#include <iostream>

Deportes::Deportes(string n, string t, double p, string c) : Juego(n, t, p)
{
    clasificacion = c;
}
void Deportes ::verInfo()
{
    Juego::verInfo();

    cout << "Clasificacion:   |" << clasificacion << endl;
}
Deportes::~Deportes() {};