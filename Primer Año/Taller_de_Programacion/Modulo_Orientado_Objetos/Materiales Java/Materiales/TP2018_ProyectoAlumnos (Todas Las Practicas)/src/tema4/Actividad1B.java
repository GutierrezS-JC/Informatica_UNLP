/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
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
        Triangulo T1= new Triangulo(in.nextDouble(), in.nextDouble(),in.nextDouble(),in.next(),in.next());
        System.out.println(T1.calcularArea());
        System.out.println(T1.calcularPerimetro());
        Triangulo T2= new Triangulo();
        T2.setLado1(in.nextDouble());
        T2.setLado2(in.nextDouble());
        T2.setLado3(in.nextDouble());
        T2.setColorLinea(in.next());
        T2.setColorRelleno(in.next());
        System.out.println(T2.calcularArea());
        System.out.println(T2.calcularPerimetro());        
    }
    
}
