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
public class Actividad2B {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        System.out.println("Ingrese nombre, sueldo basico y cantidad de campeonatos ganados: "+" - "+"(En ese orden)");
        String nombre=in.next();
        double sueldoBasico=in.nextDouble();
        int cantCampeonatos=in.nextInt();
        Entrenadores E=new Entrenadores(nombre,sueldoBasico,cantCampeonatos);
        System.out.print("El monto a cobrar total del entrenador es"+ E.calcularSueldoACobrar());
    }
    
}
