/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

import java.util.Scanner;

/**
 *
 * @author Nat
 */
public class ParcialRepaso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        System.out.println("ingrese el nombre de la banda: ");
        String nom= in.next();
        System.out.println("ingrese el tipo de musica de la banda: ");
        String tipo= in.next();
        System.out.println("ingrese la ciudad de creacion de la banda: ");
        String ciudad= in.next();
        Banda B=new Banda(nom,tipo,ciudad);
        System.out.println("ingrese el nombre del disco(zzz para terminar) ");
        String nom2=in.next();
        int aux=0;
        while((!"zzz".equals(nom2))&&(aux<20)){
            System.out.println("ingrese la fecha de lanzamiento del disco: ");
            int n=in.nextInt();
            Disco D=new Disco(nom2,n);
            B.agregarDisco(D);
            System.out.println("ingrese el nombre de la cancion: (zzz para terminar)");
            String nom3=in.next();
            int aux2=0;
            while((!"zzz".equals(nom3))&&(aux2<25)){
                System.out.println("ingrese la duracion de la cancion: ");
                int dur=in.nextInt();
                Cancion C=new Cancion(nom3,dur);
                D.agregarCancion(C);
                System.out.println("ingrese el nombre de la cancion: (zzz para terminar)");
                    nom3=in.next();
                aux2++;                
            }
            System.out.println("ingrese el nombre del disco(zzz para terminar) ");
            nom2=in.next();
            aux++; 
        }
        
    }
    
}
