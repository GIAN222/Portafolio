
public class Test {
    public static void main(String[] args) {
        // 1. crear objeto
        Almacen miBodega = new Almacen();

        for (int i = 0; i < 8; i++) {
            miBodega.agregarPila();
        }

        // 2. Preparar datos (Ingreso)

        miBodega.insertarContenedor(0, 101, "Maiz");
        miBodega.insertarContenedor(0, 102, "Trigo");
        miBodega.insertarContenedor(0, 103, "Soya");

        miBodega.insertarContenedor(1, 104, "Arroz");
        miBodega.insertarContenedor(1, 105, "Harina");
        miBodega.insertarContenedor(1, 106, "Frijol Rojo");
        miBodega.insertarContenedor(1, 107, "Frijol Verde");
        miBodega.insertarContenedor(1, 108, "Garvanzo");

        miBodega.insertarContenedor(2, 109, "Lenteja");
        miBodega.insertarContenedor(2, 110, "Frijol Negro");
        miBodega.insertarContenedor(2, 111, "Arveja");
        miBodega.insertarContenedor(2, 112, "Avena");
        miBodega.insertarContenedor(2, 113, "Banano");

        miBodega.insertarContenedor(3, 114, "Mandarina");
        miBodega.insertarContenedor(3, 115, "Papaya");
        miBodega.insertarContenedor(3, 116, "Fresa");
        miBodega.insertarContenedor(3, 117, "Guanabana");
        miBodega.insertarContenedor(3, 118, "Mango");

        miBodega.insertarContenedor(4, 119, "Atún");
        miBodega.insertarContenedor(4, 120, "Carne Roja");
        miBodega.insertarContenedor(4, 121, "Pollo");
        miBodega.insertarContenedor(4, 122, "Carne de Cerdo");
        miBodega.insertarContenedor(4, 123, "Pescado");

        miBodega.insertarContenedor(5, 124, "Chocorramo");
        miBodega.insertarContenedor(5, 125, "Ponque Bimbo");

        miBodega.insertarContenedor(6, 126, "Mní");
        miBodega.insertarContenedor(6, 127, "Almendra");

        miBodega.insertarContenedor(7, 128, "Nuez del Brazil");
        miBodega.insertarContenedor(7, 129, "Macadamia");

        System.out.println("Buscando el ID 113 (Banano)...");
        miBodega.sacarContenedor(113);

        System.out.println("------------------------------------------------------");
        System.out.println("Buscando el ID 121 (pollo)...");
        miBodega.sacarContenedor(121);

        System.out.println("------------------------------------------------------");
        System.out.println("Buscando el ID 116 (Fresa)...");
        miBodega.sacarContenedor(116);

        System.out.println("------------------------------------------------------");
        System.out.println("Buscando el ID 109 (Lenteja)...");
        miBodega.sacarContenedor(109);

        System.out.println("------------------------------------------------------");
        System.out.println("Buscando el ID 113 (Nuez del Brazil)...");
        miBodega.sacarContenedor(128);

        System.out.println("--- Fin de la prueba ---");
    }
}
