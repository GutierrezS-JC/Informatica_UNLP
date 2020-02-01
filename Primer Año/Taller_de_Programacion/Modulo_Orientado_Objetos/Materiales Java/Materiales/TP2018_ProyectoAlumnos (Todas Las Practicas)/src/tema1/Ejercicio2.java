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
public class Ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        int patente=in.nextInt();
        int cantidadTotal=0;
        int cantidadPares=0;
        while(patente!=0){
            cantidadTotal++;
            if((patente%2)==0){
                cantidadPares++;
                System.out.println("Tiene permitido el paso");}
            else
                System.out.println("No tiene permitido el paso");
            patente=in.nextInt();
        }
        System.out.println("El porcentaje de autos que ingresaron respecto al total de autos es "+(cantidadPares*100/cantidadTotal)+ "%");
        in.close();
        }
    }    
