
public class Main {

    public static void main(String[] args) {
        Arbol<String> miArbol = new Arbol<>();

        miArbol.raiz = miArbol.insertar("G", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("E", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("A", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("I", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("B", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("M", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("C", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("L", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("D", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("F", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("K", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("J", miArbol.raiz);
        miArbol.raiz = miArbol.insertar("H", miArbol.raiz);

        System.out.println("Las letras mayores a G son: ");
        miArbol.losMayores(miArbol.raiz, "G");

        System.out.println("Las letras mayores a I son: ");
        miArbol.losMayores(miArbol.raiz, "I");

        System.out.println("____________________________________________");
        System.out.println(" busqueda Postorden");
        miArbol.postOrden(miArbol.raiz);

    }
}
