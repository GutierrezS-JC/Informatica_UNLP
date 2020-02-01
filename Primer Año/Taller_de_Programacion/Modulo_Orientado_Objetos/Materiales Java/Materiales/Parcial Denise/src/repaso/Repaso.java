/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;
import java.util.Scanner;

/**
 *
 * @author JuanC
 */
public class Repaso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        Funciones F=new Funciones("Cazafantasmas","20:00","22-10-2018");
        Espectadores E;
        int dni;
        String nombre;
        int edad;
        int nroFila;
        int butaca;
        System.out.print("Ingrese DNI: ");
        dni=in.nextInt();
        while((dni!=0)&&(200>=F.calcularButacasLibres())){
            System.out.print("Ingrese su nombre: ");
            nombre=in.next();
            System.out.print("Ingrese su edad: ");
            edad=in.nextInt();
            System.out.print("Ingrese el numero de fila que prefiere: ");
            nroFila=in.nextInt();
            E=new Espectadores(nombre,dni,edad);
            if((F.validarFila(nroFila))&&((F.hayButacaLibreEnFila(nroFila)==true)) &&((F.estaRegistradoEspectador3(dni)!=true))){
                        butaca=F.agregarEspectadorAFilaConVector(nroFila, E);
                        System.out.println("El numero de butaca asignada es: "+butaca);}
            
            else
                System.out.println("No se pudo ubicar en una butaca");
            System.out.print("Ingrese DNI: ");
            dni=in.nextInt();
        } 
        System.out.println("La cantidad de butacas libres es: "+F.calcularButacasLibresConVector());
        System.out.println("La edad promedio de los espectadores registrados es: "+F.calcularEdadPromEspectadores());
    }
}
