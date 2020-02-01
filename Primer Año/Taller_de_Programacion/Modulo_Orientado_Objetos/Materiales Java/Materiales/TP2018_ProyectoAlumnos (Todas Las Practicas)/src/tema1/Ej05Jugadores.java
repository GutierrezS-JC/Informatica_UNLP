
package tema1;

//Paso 1: Importe la funcionalidad para entrada de datos
import java.util.Scanner;


public class Ej05Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double
        double vector [];
        
        //Paso 3: Crear el vector para 15 double
        vector= new double[15];
        //Paso 4: Declarar indice
        int i; int cantidad=0;
        double alturas=0;
        //Paso 5: Declarar y crear el scanner
        Scanner in= new Scanner(System.in);
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for(i=0;i<15;i++){
            System.out.print("Ingrese la altura del jugador: ");
            vector[i]=in.nextDouble();
            alturas=alturas+vector[i];
            cantidad++;
            System.out.println();
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        double promedio=(alturas/cantidad);
        int cant=0;
        System.out.println("El promedio de alturas de los jugadores es: "+ promedio);   
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por debajo del promedio)
        for(i=0;i<15;i++){
            if(vector[i]<promedio)
                cant++;
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de alturas que estan por debajo del promedio es: "+ cant);
    }
}