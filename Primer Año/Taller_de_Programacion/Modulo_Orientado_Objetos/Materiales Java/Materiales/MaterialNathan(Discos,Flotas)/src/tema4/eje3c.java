/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import static java.lang.System.in;
import java.util.Scanner;

/**
 *
 * @author Nat-PC
 */
public class eje3c {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Libro vector []= new Libro [10];
        int i;
        for(i=0;i<10;i++){
            System.out.println("ingrese el nombre del autor");
            String nom = in.next();
            System.out.println("ingrese la biografia del autor");
            String bio = in.next();
            Autor aut= new Autor(nom,bio);
            
        }
    }
    
}
