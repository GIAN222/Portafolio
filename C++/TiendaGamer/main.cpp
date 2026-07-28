#include <cstdlib> // Para rand() y srand()
#include <ctime>   // Para time()
#include <string>
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include "juego.h"
#include "accion.h"
#include "deportes.h"
#include "RPG.h"
#include "usuario.h"
#include <vector>
using namespace std;

Usuario *registrarUsuario()

{
    string n, em, pass;
    double dinero;
    // --- 1. GENERACIÓN DE ID AUTOMÁTICO ---
    // Usamos la hora actual como semilla para que el número cambie siempre
    srand(time(0));
    // Genera un numero entre 1000 y 9999
    int idAutomatico = 1000 + (rand() % 9000);

    cout << "\n -----------------------------" << endl;
    cout << "\n Nuevo miembro" << endl;
    cout << "Nombre:      |";
    cin >> n;

    cout << "\n ID:    " << idAutomatico << endl;
    cout << "\n Email:      |" << endl;
    cin >> em;

    cout << "\nEscribe tu contraseña aunque no la veas ahi estara!!" << endl;
    system("stty -echo");
    cin >> pass;
    system("stty echo");

    cout << "\ncuanto dinero vas a cargar a tu cuenta" << endl;
    cin >> dinero;
    cout << "\n -------------------------------------" << endl;
    cout << "\n Ya eres miembro oficial" << endl;
    return new Usuario(n, idAutomatico, em, pass, dinero);
};

void bienvenida()
{
    system("clear");
    int option = 0;
    string categoria = "";
    string passwordLogin;

    cout << "\n ==== Bienvenido a tu tienda virtual ====" << endl;
    cout << "\n ==== ==== ==== ==== ==== ==== ====  ====" << endl;
    cout << "\n ==== Bienvenido a tu tienda virtual ====" << endl;
    cout << "\n 1. Escribe 1 para crear una cuenta" << endl;
    cout << "\n 2. Si ya eres miembro escribe tu contraseña aqui" << endl;
    cout << "\n ____________________________" << endl;
    cin >> option;
    categoria = "";

    switch (option)
    {
    case 1:
        registrarUsuario();
        break;
    case 2:
        /*code*/
        break;

    default:
        break;
    }
};

int main();
