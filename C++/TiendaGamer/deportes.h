#pragma once
#include <string>
#include <iostream>
#include "juego.h"
using namespace std;

class Deportes : public Juego
{
private:
    string clasificacion;

public:
    Deportes(string n, string t, double p, string c);

    void verInfo() override;

    ~Deportes();
};