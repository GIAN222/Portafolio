#pragma once
#include <iostream>
#include <string>
#include "Material.h" // Usuario necesita conocer Material para hacer el array

using namespace std;

class Usuario
{
private:
    string nombre;
    int ID;
    int telefono;
    Material *mate[3];
    int contadorPrestamo = 0;

public:
    Usuario(string n, int id, int tel)
    {
        nombre = n;
        ID = id;
        telefono = tel;

        for (int i = 0; i < 3; i++) // este for es para  que la lista comience  sin datos. Mugre.
        {
            mate[i] = NULL;
        }
    }

    void devolverTodo()
    {
        cout << "Revisando mochila..." << endl;
        bool devolvioAlgo = false;
        for (int i = 0; i < 3; i++)
        {

            if (mate[i] != NULL)
            {
                devolvioAlgo = true;
                RegresarMaterial(i);
                // cout << "Los recursos han sido devueltos con exitos muchas gracias" << endl;
            }
        }
        if (devolvioAlgo == true)
        {
            // Si la bandera subió, significa que devolvimos al menos uno.
            cout << "Los recursos han sido devueltos con exito muchas gracias" << endl;
        }
        else
        {
            // Si la bandera se quedó abajo, no había nada.
            cout << "No tienes libros pendientes por devolver" << endl;
        }
    }

    void tomarMaterial(Material *m)
    {
        if (contadorPrestamo < 3)
        {
            for (int i = 0; i < 3; i++)
            {
                if (mate[i] == NULL)
                {
                    mate[i] = m;
                    contadorPrestamo++;
                    m->prestar();
                    break; // con esto salimos del bucle es muy importante para el funcionamiento.
                }
            }
        }
        else
        {
            cout << "Has exedido el limite de prestamos lo sentimos" << endl;
        }
    }

    void RegresarMaterial(int indice)
    {

        if (indice >= 0 && indice < 3 && mate[indice] != NULL)
        {

            mate[indice]->devolver();
            mate[indice] = NULL;
            contadorPrestamo--;
        }
    }

    void donarUnlibro()
    {
        cout << " Muchas gracias por tu apoyo" << endl;
    }

    void pagarAlquiler()
    {
        cout << "Tu pago fue efectuado con exito" << endl;
    }
};