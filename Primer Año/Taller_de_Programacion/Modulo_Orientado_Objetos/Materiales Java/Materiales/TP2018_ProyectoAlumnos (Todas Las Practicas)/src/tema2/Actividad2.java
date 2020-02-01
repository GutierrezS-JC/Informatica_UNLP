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
public class Actividad2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        Persona [] Vector= new Persona [5];
        int i;
        int cant=0;
        Persona DNImin=null;
        int min=9999;
        for (i=0;i<5;i++){
        Vector[i]= new Persona();
        System.out.print("Ingrese su nombre: ");
        Vector[i].setNombre(in.next());
        System.out.print("Ingrese su DNI: ");
        Vector[i].setDNI(in.nextInt());
        System.out.print("Ingrese su edad: ");
        Vector[i].setEdad(in.nextInt());
        }
        for (i=0;i<5;i++){
            if(Vector[i].getEdad()>65)
                cant++;
            if(Vector[i].getDNI()<min){
                min=Vector[i].getDNI();
                DNImin=Vector[i];
            }
        }
        System.out.println("La cantidad de pesonas mayores a 65 años es: "+ cant);
        System.out.println("A continuacion la representacion escrita de la persona con menor DNI");
        System.out.println(DNImin.toString());
    }
}