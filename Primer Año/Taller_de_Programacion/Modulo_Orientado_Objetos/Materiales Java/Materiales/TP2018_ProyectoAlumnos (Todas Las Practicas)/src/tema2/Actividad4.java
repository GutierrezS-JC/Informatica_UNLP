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
public class Actividad4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        String [] vector= new String [10];
        int i;
        System.out.println("Ingrese sus 10 palabras: ");
        for(i=0;i<10;i++)
            vector[i]=in.next();
        System.out.print("Su mensaje decodificado es: ");
        for (i=0;i<10;i++)
            System.out.print(vector[i].charAt(0));
        System.out.println();
    }
}