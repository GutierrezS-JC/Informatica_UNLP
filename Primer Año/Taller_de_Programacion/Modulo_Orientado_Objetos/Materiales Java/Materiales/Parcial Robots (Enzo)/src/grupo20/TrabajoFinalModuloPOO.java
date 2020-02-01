/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo20;
/**
 *
 * @author Alumno
 */
import java.util.Scanner;
public class TrabajoFinalModuloPOO {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in= new Scanner(System.in);
        RobotGeneral robotG= new RobotGeneral("Carlitos",in.nextInt());
        RobotEspecifico robotE= new RobotEspecifico("Arturito",in.nextInt());
        boolean ok=false;
        while (!ok){
            //avanza g
            robotG.mover();
            //avanza e
            robotE.mover();
            System.out.println("bien");
            //deposita
            if (robotG.hayFlorEnLaBolsa())
                robotG.depositarFlor();
            //deposita
            if (robotE.hayFlorEnLaBolsa())
                robotE.depositarFlor();
            //GIRO
            if ((robotG.getPasosDados() % 10)== 0){
                robotG.girarADerecha();
                robotE.girarADerecha();
            }
            //paro
            if (robotG.getPasosDados() == 40)
                ok= true;
        }
        //llamo a mostrar
        System.out.println(robotG.mostrar());
        System.out.println(robotE.mostrar());
        //informo flores depositadas por e
        System.out.println("Introdusza avenida y calle: ");
        int a= in.nextInt();
        int c= in.nextInt();
        System.out.println("Flores depositadas por Arturito en la esquina: "+robotE.devolverFloresDepositadasEnEsquina(a,c));
        System.out.println("flores depoisitadas por Carlitos: "+ robotG.getFloresDepositadas());
    }
    
}
