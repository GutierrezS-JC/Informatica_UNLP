/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;
import java.util.Scanner;

/**
 *
 * @author JuanC
 */
public class Actividad2E {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        System.out.println("Jugador:");
        System.out.print("Ingrese nombre, sueldo basico, cantidad de partidos jugados y la cantidad de goles anotados: -(En ese orden) ");
        Jugadores J=new Jugadores(in.next(),in.nextDouble(),in.nextInt(),in.nextInt());
        System.out.println("Entrenador:");
        System.out.print("Ingrese nombre, sueldo basico y la cantidad de campeonatos ganados: ");
        Entrenadores E=new Entrenadores(in.next(),in.nextDouble(),in.nextInt());
        System.out.println("Entrenador---->    "+ E.toString());
        System.out.println("Jugador---->    "+ J.toString());
    }
    
}
