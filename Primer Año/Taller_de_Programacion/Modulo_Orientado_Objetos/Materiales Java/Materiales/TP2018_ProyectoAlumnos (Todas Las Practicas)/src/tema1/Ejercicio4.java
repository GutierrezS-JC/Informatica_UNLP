/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import java.util.Scanner;

/**
 *
 * @author JuanC
 */
public class Ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        int n,i,c=1;
        for (n=1;n<=9;n++){
            for (i=n;i>0;i--){
            c=c*i;
            }
        System.out.println(c);
        c=1;
        }
    }
}