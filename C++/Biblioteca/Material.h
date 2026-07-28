#pragma once
#include <string>
#include <iostream>

using namespace std;

class Material
{
protected:
    string titulo;
    string tema;
    bool disponible;

public:
    Material(string t, string tm, bool dispo)
    {
        titulo = t;
        tema = tm;
        disponible = dispo;
    }
    void prestar()
    {
        disponible = false;
        cout << "Tu producto ha sido enviado" << endl;
    }
    string getTema() // con esta funcion puedo leer que tipo de libro es el que tengo.
    {
        return tema;
    }

    string getTitulo() // con esta funcion puedo leer que tipo de libro es el que tengo.
    {
        return titulo;
    }

    void devolver()
    {
        disponible = true;
        }
    virtual void mostrarDetalles()
    {
        cout << "Titulo:     |" << titulo << endl;
        cout << "tema:       |" << tema << endl;
    }
};
