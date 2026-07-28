#include "usuario.h"
#include <iostream>

Usuario::Usuario(string n, int id, string em, string p, double d)
{
    nombre = n;
    ID = id;
    email = em;
    password = p;
    dinero = d;
    Juego *miBiblioteca[20];

    for (int i = 0; i < 20; i++)
    {
        miBiblioteca[20] = NULL;
    }
}

void Usuario::mostrarBiblioteca()
{
    bool bibliotecaVacia = true;
    cout << " Estos son los juego que tienes " << endl;

    for (int i = 0; i < 20; i++)
    {
        if (miBiblioteca[i] != NULL)
        {
            cout << "1." << i + 1 << endl;
            miBiblioteca[i]->verInfo();
            bibliotecaVacia = false;
        }
    }
    if (bibliotecaVacia = true)
    {
        cout << " No tienes juegos por el  momento " << endl;
    }
}
void Usuario::comprar(Juego *nuevoJuego)

{
    if (dinero >= nuevoJuego->getPrecio())
    {
        for (int i = 0; i < 20; i++)
        {
            if (miBiblioteca[i] == NULL)
            {
                miBiblioteca[i] = nuevoJuego;
                dinero = dinero - nuevoJuego->getPrecio();
                cout << "\n El juego a sido añadido a tu biblioteca, ya puedes disfrutarlo" << endl;
                cout << "\n Disfruta de:   |" << nuevoJuego->getNombre() << endl;
                cout << "tu saldo es ahora de: $ " << dinero << endl;
                return;
            }
        }
        cout << "Ya no tienes espacio para comprar mas juego elimina o compra mas espacio" << endl;
    }
    else
    {
        double faltante = nuevoJuego->getPrecio() - dinero;
        cout << "\n No tienes suficiente dinero para comprar este juego";
        cout << "\n te hace falta" << faltante << endl;
    }
}

bool Usuario::validarCuenta(string passw)
{
    if (passw == password)
    {
        cout << "Contraseña correcta" << endl;
        return true;
    }
    else
    {
        cout << "Contraseña incorrecta " << endl;
        return false;
    }
};