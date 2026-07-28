
public class Pasajero {

    public String nombre;
    public int asientoNumero;

    public Pasajero(String n, int asiento) {
        this.nombre = n;
        this.asientoNumero = asiento;
    }

    @Override
    public String toString() {
        return this.nombre;
    }

}
