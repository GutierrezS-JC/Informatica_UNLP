/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import java.util.Scanner;
/**
 *
 * @author JuanC
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        double a= in.nextDouble();
        double b= in.nextDouble();
        double c= in.nextDouble();
        double perimetro;
        perimetro= a+b+c;
        in.close();
        if ((a< b + c) && (b < a + c) && (c < a + b))
            System.out.println("Es valido y su perimetro es:" + perimetro);
        else
            System.out.println("No es valido");
        
    }
}