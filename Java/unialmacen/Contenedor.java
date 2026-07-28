
public class Contenedor {
    private int ID;
    private String nombre;

    public Contenedor(int id, String n) {
        this.ID = id;
        this.nombre = n;
    }

    public int getId() {
        return ID;
    } // Faltaba el tipo 'int'

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return "ID: " + ID + " | Producto: " + nombre;
    }
}
