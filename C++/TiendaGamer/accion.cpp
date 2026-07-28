#include <iostream>
#include "accion.h"
#include <string>

Accion ::Accion(string n, string t, double p, string e) : Juego(n, t, p)
{
    estilo = e;
}
void Accion ::verInfo()
{
    Juego::verInfo();
    cout << "Estilo:    |" << estilo << endl;
}
Accion ::~Accion() {}
