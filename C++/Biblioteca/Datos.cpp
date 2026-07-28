#include "Datos.h"

// Aquí NO ponemos el punto y coma al final de la función, porque abrimos llaves {}
void cargarLibros(std::vector<Libro *> &biblioteca)
{

    // Infantiles
    biblioteca.push_back(new Libro("El Principito", "Infantil", "Saint-Exupery", "Salamandra", true));
    biblioteca.push_back(new Libro("Donde viven los monstruos", "Infantil", "Maurice Sendak", "Alfaguara", true));
    biblioteca.push_back(new Libro("El monstruo de colores", "Infantil", "Anna Llenas", "Flamboyant", true));
    biblioteca.push_back(new Libro("Matilda", "Infantil", "Roald Dahl", "Alfaguara Infantil", true));
    biblioteca.push_back(new Libro("Adivina cuánto te quiero", "Infantil", "Sam McBratney", "Kókinos", true));

    // Fantasía
    biblioteca.push_back(new Libro("El Señor de los Anillos", "Fantasía", "J.R.R. Tolkien", "Minotauro", true));
    biblioteca.push_back(new Libro("Harry Potter y la piedra filosofal", "Fantasía", "J.K. Rowling", "Salamandra", true));
    biblioteca.push_back(new Libro("El nombre del viento", "Fantasía", "Patrick Rothfuss", "Plaza & Janés", true));
    biblioteca.push_back(new Libro("El Imperio Final", "Fantasía", "Brandon Sanderson", "Nova", true));
    biblioteca.push_back(new Libro("Juego de Tronos", "Fantasía", "George R.R. Martin", "Gigamesh", true));

    // Terror (Aquí corregí el error que tenías en la imagen)
    biblioteca.push_back(new Libro("It", "Terror", "Stephen King", "Debolsillo", true));
    biblioteca.push_back(new Libro("Drácula", "Terror", "Bram Stoker", "Valdemar", true));
    biblioteca.push_back(new Libro("La llamada de Cthulhu", "Terror", "H.P. Lovecraft", "Valdemar", true));
    biblioteca.push_back(new Libro("La maldición de Hill House", "Terror", "Shirley Jackson", "Minúscula", true));
    biblioteca.push_back(new Libro("Frankenstein", "Terror", "Mary Shelley", "Alianza Editorial", true));
}