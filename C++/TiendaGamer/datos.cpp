#include "datos.h"
#include "accion.h"
#include "RPG.h"
#include "deportes.h"

// Aquí NO ponemos el punto y coma al final de la función, porque abrimos llaves {}
void cargarJuegos(std::vector<Juego *> &biblioteca)
{
    biblioteca.push_back(new Accion("Call of Duty: MW3", "Shooter", 69.99, "Primera Persona"));
    biblioteca.push_back(new Accion("God of War", "Hack & Slash", 49.99, "Tercera Persona"));
    biblioteca.push_back(new Accion("Grand Theft Auto V", "Mundo Abierto", 29.99, "Sandbox"));
    biblioteca.push_back(new Accion("Cyberpunk 2077", "RPG Accion", 59.99, "Futurista"));
    biblioteca.push_back(new Accion("Red Dead Redemption 2", "Aventura", 39.99, "Western"));

    // --- SECCION: JUEGOS RPG ---
    biblioteca.push_back(new RPG("Final Fantasy VII", "JRPG", 69.99, "Japon"));
    biblioteca.push_back(new RPG("The Witcher 3", "RPG Accion", 39.99, "Polonia"));
    biblioteca.push_back(new RPG("Baldurs Gate 3", "RPG Turnos", 59.99, "Reinos Olvidados"));
    biblioteca.push_back(new RPG("Dark Souls III", "Souls-like", 49.99, "Lothric"));
    biblioteca.push_back(new RPG("Persona 5 Royal", "JRPG", 59.99, "Japon"));

    // --- SECCION: JUEGOS DE DEPORTES ---
    biblioteca.push_back(new Deportes("EA FC 24", "Futbol", 69.99, "Todo Publico"));
    biblioteca.push_back(new Deportes("NBA 2K24", "Baloncesto", 59.99, "Todo Publico"));
    biblioteca.push_back(new Deportes("F1 23", "Carreras", 49.99, "Todo Publico"));
    biblioteca.push_back(new Deportes("UFC 5", "Lucha", 69.99, "T - Adolescentes"));
    biblioteca.push_back(new Deportes("WWE 2K24", "Wrestling", 59.99, "T - Adolescentes"));
}
