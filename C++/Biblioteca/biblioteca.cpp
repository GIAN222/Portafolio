#include <string>
#include <iostream>
#include "Material.h"
#include <fstream>
#include <stdlib.h>
#include "Usuario.h"
#include "Libro.h"
#include "Datos.h"
#include <vector>
using namespace std;

void mostrarCategoria(vector<Libro *> &lista, Usuario &usuario)
{
    bool salir = false;

    while (!salir)
    {
        system("clear");
        int option = 0;
        string categoria = "";

        cout << "\n=== Biblioteca Virtual ===" << endl;
        cout << "1.  Terror" << endl;
        cout << "2.  Infantil" << endl;
        cout << "3.  Fantasía" << endl;
        cout << "4.  Revistas" << endl;
        cout << "5.  Devolver libro" << endl;
        cout << "6.  salir" << endl;
        cout << "\n ---------------------------------" << endl;
        cout << "[ Escribe tu eleccion aquí] " << endl;
        cout << "\n ---------------------------------";
        cin >> option;
        categoria = ""; // Reiniciamos la categoría para evitar errores
        cout << "\n ---------------------------------" << endl;

        switch (option)
        {

        case 1:
            categoria = "Terror";
            break;
        case 2:
            categoria = "Infantil";
            break;
        case 3:
            categoria = "Fantasía";
            break;
        case 4:
            categoria = "Revistas";
            break;
        case 5:
            system("clear");
            categoria = "Devolver libro";
            system("clear");
            cout << "\n--- TU MOCHILA (DEVOLUCIONES) ---" << endl;
            usuario.devolverTodo();
            categoria = "";
            cout << "\nPresiona ENTER para continuar...";
            cin.ignore();
            cin.get();
            break;
        case 6:
            salir = true;
            break;
        default:
            cout << "Opción no válida." << endl;
        }

        if (option != 5 && option != 6)
        {
            cout << "\n--- Libros encontrados de: " << categoria << " ---" << endl;

            vector<Libro *> librosEnPantalla;
            for (int i = 0; i < lista.size(); i++)
            {
                lista[i]->getTema();
                string selection = lista[i]->getTema();
                if (categoria == selection && categoria != "Devolver libro")
                {
                    librosEnPantalla.push_back(lista[i]);
                    cout << "[" << librosEnPantalla.size() << "] ";
                    cout << "\n                             " << endl;
                    lista[i]->mostrarDetalles();
                    cout << "------------------" << endl; // Separador visual
                };
            }
            if (librosEnPantalla.size() > 0)
            {
                int Selection = 0;
                cout << "Escribe el numero de libro que deseas llevar" << endl;
                cout << "\n ---------------------------";
                cin >> Selection;
                cout << "\n ---------------------------" << endl;
                if (Selection > 0 && Selection <= librosEnPantalla.size())
                {
                    int indice = Selection - 1;
                    Libro *libroElegido = librosEnPantalla[indice];
                    cout << "\n------------------------------" << endl;
                    cout << "HAS ELEGIDO: " << libroElegido->getTitulo() << endl;
                    cout << "---------------------------------" << endl;
                    usuario.tomarMaterial(libroElegido);

                    cout << "---------------------------------" << endl;
                }
                else if (Selection < 0 || Selection > librosEnPantalla.size())
                {
                    cout << "Este numero no se encuentra en esta lista" << endl;
                }
            }
            else
            {
                cout << "No hay libros disponibles en esta categoria" << endl;
            }

            cout << "\nPresiona ENTER para continuar...";
            cin.ignore(); // Limpia el buffer
            cin.get();    // Espera el enter
        }
    }
};

int main()
{

    // 1. Preparamos la estantería (un vector vacío de punteros a Libro)
    vector<Libro *> miBiblioteca;

    // 2. Llenamos la estantería con los libros que definiste en Datos.cpp
    cargarLibros(miBiblioteca);
    Usuario miUsuario("Giancarlo Franco", 1, 3125287653);

    // 3. Verificamos si funcionó
    cout << "Sistema iniciado correctamente." << endl;
    cout << "Se han cargado " << miBiblioteca.size() << " libros en la biblioteca." << endl;

    mostrarCategoria(miBiblioteca, miUsuario);

    return 0;
};
