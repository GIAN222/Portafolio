#pragma once
#include <iostream>
#include <string>
#include "juego.h"
using namespace std;

class Usuario
{
private:
    string nombre;
    int ID;
    string email;
    string password;
    Juego *miBiblioteca[20];
    double dinero;

public:
    Usuario(string n, int id, string em, string p, double d);

    void comprar(Juego *nuevoJuego);
    // Método para ver qué tiene comprado
    void mostrarBiblioteca();
    bool validarCuenta(string passw);
    void agregar();
    void jugar();
    void eliminar();
    void fondos();
};