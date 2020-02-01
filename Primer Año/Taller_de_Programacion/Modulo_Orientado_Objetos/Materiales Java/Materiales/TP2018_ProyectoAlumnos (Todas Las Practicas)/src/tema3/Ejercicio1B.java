/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import java.util.Scanner;

/**
 *
 * @author JuanC
 */
public class Ejercicio1B {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        Triangulo T= new Triangulo();
        System.out.print("Ingrese lado 1: ");
        T.setLado1(in.nextInt());
        System.out.print("Ingrese lado 2: ");
        T.setLado2(in.nextInt());
        System.out.print("Ingrese lado 3: ");
        T.setLado3(in.nextInt());
        System.out.print("Ingrese color de relleno: ");
        T.setColorRelleno(in.next());
        System.out.print("Ingrese color de linea: ");
        T.setColorLinea(in.next());
        System.out.println("El area del triangulo es: "+T.calcularArea());
        System.out.println("El perimetro del triangulo es: "+T.calcularPerimetro());
        
    }
    
}
