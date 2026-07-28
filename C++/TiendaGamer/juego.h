#pragma once
#include <string>
#include <iostream>
using namespace std;

class Juego
{
protected:
    string nombre;
    string tipo;
    double precio;

public:
    Juego(string n, string t, double p);

    virtual void verInfo();

    string getNombre();

    double getPrecio();
    Juego::~Juego();
};
