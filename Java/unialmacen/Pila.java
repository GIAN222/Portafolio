
public class Pila {
    private Contenedor[] estante;
    private int marcador;
    private final int N = 5;

    public Pila() {
        this.estante = new Contenedor[N];
        this.marcador = 0;
    }

    public int getMarcador() {
        return marcador;
    }

    public void apilar(int id, String n) {
        if (marcador < N) {
            this.estante[marcador] = new Contenedor(id, n);
            marcador++;
        } else {
            System.out.println("Pila llena.");
        }
    }

    public void apilar(Contenedor c) {
        if (marcador < N && c != null) {
            this.estante[marcador] = c;
            marcador++;
        }
    }

    public Contenedor desapilar() {
        if (marcador > 0) {
            Contenedor temporal = estante[marcador - 1];
            estante[marcador - 1] = null;
            marcador--;
            return temporal;
        }
        return null;
    }

    public int examinar(int id) {
        for (int i = 0; i < marcador; i++) { // Solo hasta marcador para evitar null
            if (this.estante[i] != null && this.estante[i].getId() == id) {
                return i;
            }
        }
        return -1;
    }
}