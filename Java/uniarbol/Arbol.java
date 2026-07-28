
public class Arbol<T extends Comparable<T>> {
    Nodo<T> raiz;

    public Arbol() {
        this.raiz = null;
    }

    public void losMayores(Nodo<T> actual, T num) {

        if (actual == null) {
            return;
        }

        losMayores(actual.right, num);

        if (actual.value.compareTo(num) > 0) {
            System.out.println(actual.value);
        }

        losMayores(actual.left, num);

    }

    public void postOrden(Nodo<T> actual) {
        if (actual == null) {
            return;
        }
        postOrden(actual.left);
        postOrden(actual.right);
        System.out.println(actual.value);
    }

    public Nodo<T> insertar(T value, Nodo<T> actual) {
        if (actual == null) {
            return new Nodo<>(value);
        }
        if (actual.value.compareTo(value) < 0) {
            actual.right = insertar(value, actual.right);
        } else if (actual.value.compareTo(value) > 0) {
            actual.left = insertar(value, actual.left);
        }
        return actual;
    }

}
