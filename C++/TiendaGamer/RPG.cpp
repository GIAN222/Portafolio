#include <iostream>
#include "RPG.h"
using namespace std;

RPG::RPG(string n, string t, double p, string o) : Juego(n, t, p)
{
    origen = o;
};

void RPG ::verInfo()
{
    Juego::verInfo();
    cout << " Origen:    | " << origen << endl;
};

RPG::~RPG() {}
