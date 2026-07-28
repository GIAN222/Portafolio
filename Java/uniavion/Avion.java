
import java.util.LinkedList;
import java.util.Queue;

public class Avion {
    private int capacidad = 3;
    private int asientosOcupados;
    private Queue<Pasajero> listaEspera;

    public Avion(int capInicial) {
        this.capacidad = capInicial;
        this.asientosOcupados = 0;
        this.listaEspera = new LinkedList<>();
    }

    public void reservar(String nom) {

        if (asientosOcupados < capacidad) {
            int asientoAsignado = asientosOcupados + 1;
            Pasajero p = new Pasajero(nom, asientoAsignado);
            asientosOcupados++;

            System.out.println("El asiento:  " + asientoAsignado + "  a sido asignado a " + p);

        } else {
            Pasajero pasEnEspera = new Pasajero(nom, 0);
            this.listaEspera.add(pasEnEspera);
            System.out.println("El pasajero fue añadido a la fila de espera");
        }
    }

    public void liberar() {

        if (asientosOcupados > 0) {
            int asientoQueQuedeLibre = asientosOcupados; // Guardamos el número
            asientosOcupados--;
            System.out.println("\nSe ha liberado el asiento número: " + asientoQueQuedeLibre);

            if (!listaEspera.isEmpty()) {
                Pasajero siguiente = listaEspera.poll();

                siguiente.asientoNumero = asientoQueQuedeLibre;
                asientosOcupados++;

                System.out.println("El pasajero " + siguiente.nombre +
                        " ha sido asignado al asiento " + siguiente.asientoNumero);
            } else {
                System.out.println(">>> No hay pasajeros en lista de espera.");
            }
        } else {
            System.out.println("\n El avión ya está vacío.");
        }
    }

    public void ShowData() {
        System.out.println("\n ============================================================");
        System.out.println("\n =====     Reporte de ocupacion en el Avion     ============ ");
        System.out.println("\n ============================================================");
        System.out.printf("\n | %-19s | %-19s | %-19s |", "Nombre", "Estado", "Asiento");
        System.out.println("\n ============================================================");

        if (!listaEspera.isEmpty()) {
            for (Pasajero p : listaEspera) {
                System.out.printf("| %-19s | %-19s | %-19s |\n", p.nombre, "En espera", "N/A");
            }
        }
        System.out.println("\n ============================================================");
        System.out.println("Resumen: " + asientosOcupados + " de " + capacidad + " asientos ocupados");
        System.out.println("Pasajeros en Lista de espera " + listaEspera.size());
        System.out.println("\n ============================================================");

    }

}
