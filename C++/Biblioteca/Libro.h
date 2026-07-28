#pragma once
#include <string>
#include <iostream>
#include "Material.h"
using namespace std;

class Libro : public Material
{
private:
    string autor;
    string editorial;

public:
    Libro(string t, string tm, string a, string e, bool dispo) : Material(t, tm, dispo)
    {
        autor = a;
        editorial = e;
    }

    void mostrarDetalles() override
    {
        Material::mostrarDetalles(); // Llama al padre para pintar titulo y tema
        cout << "Autor:      |" << autor << endl;
        cout << "Editorial:  |" << editorial << endl;
    }
};