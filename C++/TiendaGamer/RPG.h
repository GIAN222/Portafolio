#pragma once
#include "juego.h" // <--- ¡Obligatorio! Necesita conocer a su padre
#include <string>
#include <iostream>
using namespace std;

class RPG : public Juego
{
private:
    string origen;

public:
    RPG(string n, string t, double p, string o);

    void verInfo() override;

    ~RPG();
};
