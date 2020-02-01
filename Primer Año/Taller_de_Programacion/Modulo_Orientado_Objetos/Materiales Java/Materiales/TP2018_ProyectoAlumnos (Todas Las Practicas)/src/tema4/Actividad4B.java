/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import java.util.Scanner;

/**
 *
 * @author alumnos
 */
public class Actividad4B {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        Micros M=new Micros("ABC123","Mar del Plata","5:00 am");
        int num=in.nextInt();
        while((num!=-1)&&(M.lleno()==false)){
            if((M.valido(num))&&(M.ocupado(num)==false)){
                M.ocupar(num);
                System.out.println("Reserva completada");}
            else
                System.out.println("El asiento está ocupado o el número ingresado no es válido, el primer asiento libre es: "+M.libre());}
        System.out.println("Se ocuparon "+M.getCantOcupados()+" asientos");
    }
    
}
