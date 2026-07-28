
import java.util.ArrayList;

public class Almacen {
    private Pila auxiliar1;
    private Pila auxiliar2;
    private ArrayList<Pila> almacen;
    private final int tope = 10;

    public Almacen() {
        this.auxiliar1 = new Pila();
        this.auxiliar2 = new Pila();
        this.almacen = new ArrayList<>();
    }

    public void agregarPila() {
        if (this.almacen.size() < this.tope) {
            this.almacen.add(new Pila());
            System.out.println("Pila agregada. Total: " + this.almacen.size());
        } else {
            System.out.println("No puedes agregar mas Pilas al Almacén. Capacidad maxima al limite");
        }
    }

    public void insertarContenedor(int numPila, int id, String n) {
        if (numPila < almacen.size()) {
            almacen.get(numPila).apilar(id, n);
        }
    }

    private void despejarPila(int posEnPila, Pila pi) {
        // Quitamos los elementos que están arriba del objetivo
        while (pi.getMarcador() > (posEnPila + 1)) {
            Contenedor estorbo = pi.desapilar();
            if (this.auxiliar1.getMarcador() < 5) {
                this.auxiliar1.apilar(estorbo);
            } else {
                this.auxiliar2.apilar(estorbo);
            }
        }
    }

    public void reubicarContenedor(Pila pi) {
        while (this.auxiliar1.getMarcador() > 0) {
            Contenedor temp1 = this.auxiliar1.desapilar();
            pi.apilar(temp1.getId(), temp1.getNombre());
        }
        while (this.auxiliar2.getMarcador() > 0) {
            Contenedor temp2 = this.auxiliar2.desapilar();
            pi.apilar(temp2.getId(), temp2.getNombre());
        }
    }

    public void sacarContenedor(int id) {
        for (int i = 0; i < almacen.size(); i++) {
            Pila pilaActual = almacen.get(i);
            int pos = pilaActual.examinar(id);

            if (pos != -1) {
                System.out.println("Encontrado en Pila " + i + ", Posición " + pos);
                despejarPila(pos, pilaActual);

                Contenedor sacado = pilaActual.desapilar();
                System.out.println(">>> CONTENEDOR RETIRADO: " + sacado);
                reubicarContenedor(pilaActual);
                return;
            }
        }
        System.out.println("No se encontró el contenedor.");
    }

}
