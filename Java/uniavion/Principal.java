import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        Avion miAvion = new Avion(3);
        int opcion;
        String nombre;

        do {

            System.out.println("\n=================================================================");
            System.out.println("     Bienvenido al sistema automatico de asignacion de asiento     ");
            System.out.println("===================================================================");
            System.out.println("1. Reservar asiento");
            System.out.println("2. Liberar asiento");
            System.out.println("3. mostrar datos");
            System.out.println("4. Salir");
            System.out.println("Seleccione una opcion");
            opcion = teclado.nextInt();
            teclado.nextLine();

            switch (opcion) {

                case 1:
                    System.out.println("\n Has elejido reservar un asiento");
                    System.out.println("\n Escribe tu nombre");
                    nombre = teclado.nextLine();
                    miAvion.reservar(nombre);
                    break;

                case 2:
                    System.out.println("\n Has elejido liberar tu asiento");
                    miAvion.liberar();
                    break;
                case 3:
                miAvion.ShowData();
                break;
            }
        } while (opcion != 4);

        System.out.println("\nPrograma finalizado.");
        teclado.close();

    }

}
