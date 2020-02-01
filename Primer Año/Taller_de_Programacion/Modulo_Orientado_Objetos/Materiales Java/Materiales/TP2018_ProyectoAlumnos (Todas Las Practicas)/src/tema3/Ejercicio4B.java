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
public class Ejercicio4B {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        Circulo C=new Circulo();
        System.out.print("Ingrese Radio: ");
        C.setRadio(in.nextDouble());
        System.out.print("Ingrese color de relleno: ");
        C.setColorRelleno(in.next());
        System.out.print("Ingrese color de linea: ");
        C.setColorLinea(in.next());
        System.out.println("El perimetro es: "+C.calcularPerimetro());
        System.out.println("El area es: "+C.calcularArea());
    }
}
