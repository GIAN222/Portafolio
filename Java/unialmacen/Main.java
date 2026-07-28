public class Main {

    class Nodo {
        char dato;
        int valor; // Para el ejercicio de búsqueda
        Nodo izquierdo, derecho;

        public Nodo(char item) {
            dato = item;
            izquierdo = derecho = null;
        }
    }

    public class ArbolBinario {
        static int preIndex = 0;

        // Método para imprimir nodos mayores a un valor dado (BST)
        public void imprimirMayores(Nodo nodo, int k) {
            if (nodo == null)
                return;

            // En un BST, si el valor es mayor, buscamos en el subárbol derecho e izquierdo
            if (nodo.valor > k) {
                System.out.print(nodo.valor + " ");
            }
            imprimirMayores(nodo.izquierdo, k);
            imprimirMayores(nodo.derecho, k);
        }

        // Construir árbol desde Preorden e Inorden
        public Nodo construirArbol(char[] in, char[] pre, int inStrt, int inEnd) {
            if (inStrt > inEnd)
                return null;

            Nodo tNode = new Nodo(pre[preIndex++]);

            if (inStrt == inEnd)
                return tNode;

            int inIndex = buscar(in, inStrt, inEnd, tNode.dato);

            tNode.izquierdo = construirArbol(in, pre, inStrt, inIndex - 1);
            tNode.derecho = construirArbol(in, pre, inIndex + 1, inEnd);

            return tNode;
        }

        int buscar(char[] arr, int strt, int end, char value) {
            for (int i = strt; i <= end; i++) {
                if (arr[i] == value)
                    return i;
            }
            return -1;
        }

        void imprimirPostorden(Nodo nodo) {
            if (nodo == null)
                return;
            imprimirPostorden(nodo.izquierdo);
            imprimirPostorden(nodo.derecho);
            System.out.print(nodo.dato + " ");
        }

        public static void main(String[] args) {
            ArbolBinario arbol = new ArbolBinario();
            char in[] = { 'I', 'A', 'B', 'E', 'G', 'L', 'D', 'C', 'F', 'M', 'K', 'H', 'J' };
            char pre[] = { 'G', 'E', 'A', 'I', 'B', 'M', 'C', 'L', 'D', 'F', 'K', 'J', 'H' };

            int n = in.length;
            Nodo raiz = arbol.construirArbol(in, pre, 0, n - 1);

            System.out.println("Recorrido Postorden generado:");
            arbol.imprimirPostorden(raiz);
        }
    }
}
