
public class Nodo<T> {

    Nodo<T> left;
    Nodo<T> right;
    T value;

    public Nodo(T value) {
        this.left = null;
        this.right = null;
        this.value = value;
    }
}
