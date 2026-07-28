#pragma once
#include <string>
#include <iostream>
#include "juego.h"
using namespace std;

class Accion : public Juego
{
private:
    string estilo;

public:
    Accion(string n, string t, double p, string e);

    void verInfo() override;

    ~Accion();
};