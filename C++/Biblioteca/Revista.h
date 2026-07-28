#pragma once
#include <string>
#include <iostream>
#include "Material.h"
using namespace std;

class Revista : public Material
{
private:
    string fechaDePublicacion;

public:
    Revista(string t, string tm, string fp, bool dispo) : Material(t, tm, dispo)
    {
        fechaDePublicacion = fp;
    };

    void mostrarDetalles() override
    {
        Material::mostrarDetalles(); // Llama al padre para pintar titulo y tema
        cout << "Fecha de publicacion : |" << fechaDePublicacion << endl;
    }
};