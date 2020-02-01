/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;
import java.util.Scanner;

/**
 *
 * @author JuanC
 */
public class Ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        System.out.println("Ingrese color de linea, color de relleno y un radio para el circulo: -(En ese orden) ");
        Circulo C=new Circulo(in.next(),in.next(),in.nextDouble());
        System.out.println("El color de linea del circulo es: "+ C.getColorLinea());
        System.out.println("El color de relleno del circulo es: "+ C.getColorRelleno());
        System.out.println("El radio del circulo es: "+C.getRadio());
        System.out.println("El area del circulo es: "+C.calcularArea());
        System.out.println("El perimetro del circulo es: "+C.calcularPerimetro());
    }
    
}
