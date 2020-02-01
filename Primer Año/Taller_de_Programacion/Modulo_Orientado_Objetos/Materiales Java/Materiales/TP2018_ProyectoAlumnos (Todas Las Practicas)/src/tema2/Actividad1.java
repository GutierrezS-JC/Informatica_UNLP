/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import java.util.Scanner;

/**
 *
 * @author JuanC
 */
public class Actividad1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        Persona P= new Persona();
        System.out.print("Ingrese su nombre: ");
        P.setNombre(in.next());
        System.out.print("Ingrese su DNI: ");
        P.setDNI(in.nextInt());
        System.out.print("Ingrese su edad: ");
        P.setEdad(in.nextInt());
        System.out.println(P.toString());
    }
    
}
