
#include "juego.h"

using namespace std;

Juego::Juego(string n, string t, double p)
{
    nombre = n;
    tipo = t;
    precio = p;
};

void Juego::verInfo(){
    {cout << "Nombre del juego:   |" << nombre << endl;
cout << "Tipo            :   |" << tipo << endl;
cout << "Precio          :   |" << precio << endl;
}
}
;

std::string Juego::getNombre(){
    {return nombre;
}
}
;

double Juego::getPrecio(){
    {return precio;
}
}
;

Juego::~Juego() {}
