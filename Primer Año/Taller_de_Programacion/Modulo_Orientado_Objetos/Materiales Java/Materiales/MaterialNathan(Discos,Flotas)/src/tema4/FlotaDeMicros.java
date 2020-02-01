/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import java.util.Scanner;

/**
 *
 * @author Nat
 */
public class FlotaDeMicros {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Todos los Strings van con EQUALS().
        Scanner in = new Scanner (System.in);
        Flota F=new Flota();
        System.out.println("ingrese una pantente (ZZZ000 para terminar)  ");
        String patente=in.next();
        while((!"ZZZ000".equals(patente))&&(F.estaCompleta()==false)){
            System.out.println("ingrese destino:");
            String des=in.next();
            System.out.println("ingrese hora de salida: ");
            String hora=in.next();
            Micro m=new Micro(patente,des,hora);
            F.agregarFlota(m);
            System.out.println("ingrese una pantente (ZZZ000 para terminar)  ");
            patente=in.next();
        }
        System.out.println("ingrese una patente de micro a buscar: ");
        patente=in.next();
        Micro M4=F.retornarMicroPatente(patente);
        if(M4.getPatente().equals(patente)){
            System.out.println("encontre micro");
            Micro m2=F.retornarMicroPatente(patente);
            F.eliminarPatente(m2.getPatente());
        }
        else System.out.println("el micro no se encontro");
        System.out.println("ingrese destino a buscar:");
        String des2=in.next();
        Micro m3=F.retornarMicroDestino(des2);
        if(m3.getDestino().equals(des2)){
            System.out.println("encontre el micro con el destino");
            System.out.println(m3.getPatente());
            System.out.println(m3.getDestino());
            System.out.println(m3.getHoraSalida());
        }
        else System.out.println("no lo encontre");
        
        
        
    }
    
}
