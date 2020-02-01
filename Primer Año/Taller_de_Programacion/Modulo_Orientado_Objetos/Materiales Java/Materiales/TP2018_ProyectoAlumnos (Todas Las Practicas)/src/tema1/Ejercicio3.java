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
public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        int m=in.nextInt();
        int n=1;
        int i;
        for(i=m;i>0;i--)
            n=n*(i);
        System.out.println("El factorial es: "+n);     
    }
}