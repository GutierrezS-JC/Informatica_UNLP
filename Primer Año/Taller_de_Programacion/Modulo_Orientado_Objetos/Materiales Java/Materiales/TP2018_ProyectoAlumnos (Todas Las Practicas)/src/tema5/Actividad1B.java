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
public class Actividad1B {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        Triangulo T=new Triangulo(in.next(),in.next(),in.nextDouble(),in.nextDouble(),in.nextDouble());
        Cuadrado C=new Cuadrado(in.nextDouble(),in.next(),in.next());
        System.out.println("El area del triangulo es: "+T.calcularArea()+ "y su perimetro es: "+T.calcularPerimetro());
        System.out.println("El area del cuadrado es: "+ C.calcularArea()+ "y su perimetro es: "+ C.calcularPerimetro());
    }
    
}
