/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import java.util.Scanner;

/**
 *
 * @author JuanC
 */
public class Ejercicio3B {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        Entrenadores E=new Entrenadores();
        System.out.print("Ingrese el nombre: ");
        E.setNombre(in.next());
        System.out.print("Ingrese el sueldo basico: ");
        E.setSueldoBasico(in.nextDouble());
        System.out.print("Ingrese la cantidad de campeonatos ganados: ");
        E.setCantCampeonatosGanados(in.nextInt());
        System.out.print("El sueldo que le corresponde cobrar es: "+E.calcularSueldoACobrar());
    }
    
}
