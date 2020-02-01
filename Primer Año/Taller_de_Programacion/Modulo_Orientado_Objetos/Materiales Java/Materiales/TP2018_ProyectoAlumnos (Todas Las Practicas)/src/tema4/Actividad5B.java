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
public class Actividad5B {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        Flotas F= new Flotas();
        Micros M=new Micros(in.next(),in.next(),in.next());
        while((!"ZZZ000".equals(M.getPatente()))&&(F.completa()==false)){
           F.agregarMicro(M);
           M=new Micros(in.next(),in.next(),in.next());
    }
        String patente=in.next();
        F.eliminarMicro(patente);
        String destino=in.next();
        M=F.buscarDestino(destino);
        System.out.println("La patente y la hor de salida del micro que viaja a dicho destino son: "+M.getPatente()+M.getHoraSalida());
            
    }
    
}
