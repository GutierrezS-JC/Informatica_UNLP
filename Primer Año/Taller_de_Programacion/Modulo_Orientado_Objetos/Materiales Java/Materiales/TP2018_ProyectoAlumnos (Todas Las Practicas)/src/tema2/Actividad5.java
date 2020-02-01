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
public class Actividad5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        Partido [] vector= new Partido[60];
        int i;
        int cant=0;
        int cantGoles=0;
        int cantidadEmpate=0;
        int cantPartidosJugados=0;
        for (i=0;i<60;i++){
            vector[i]=new Partido();
            System.out.println("Ingrese nombre del equipo local: ");
            vector[i].setLocal(in.next());
            System.out.println("Ingrese nombre del equipo visitante: ");
            vector[i].setVisitante(in.next());
            System.out.println("Ingrese cantidad de goles del local: ");
            vector[i].setGolesLocal(in.nextInt());
            System.out.println("Ingrese cantidad de goles del visitante: ");
            vector[i].setGolesVisitante(in.nextInt());           
        }
        for (i=0;i<60;i++){
            cantPartidosJugados++;
            if(vector[i].hayGanador()){
                if("River".equals(vector[i].getGanador()))
                    cant++;
            }
            else 
                cantidadEmpate++;
            if(vector[i].getLocal()=="Boca")
                cantGoles=cantGoles + vector[i].getGolesLocal(); 
        }
        System.out.println("La cantidad de partidos que gano river es: "+ cant );
        System.out.println("La cantidad de goles que realizo boca es "+ cantGoles);
        System.out.println("El porcentaje de partidos finalizados con empate es: "+((cantidadEmpate*100)/cantPartidosJugados));
    }
    
}