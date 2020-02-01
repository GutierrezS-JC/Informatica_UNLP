/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Nat
 */
public class Funciones {
    private String titulo;
    private int fecha;
    private int hora;
    private Espectadores sala[][]=new Espectadores[20][10];
    private int vector[]=new int [20];
    //constructor de funcion vacia.
    public Funciones (String unTitulo,int unaFecha,int unaHora){
        titulo=unTitulo;
        fecha=unaFecha;
        hora=unaHora;
        int i,j;
        for(i=0;i<20;i++){
            for(j=0;j<10;j++){
                sala[i][j]=null;
            }
        }       
    }
    
    //metodos set y gets de las variables de instancia titulo fecha hora.
    
    public void setTitulo(String unTitulo){
        titulo=unTitulo;
    }
    public String getTitulo(){
        return titulo;
    }
    
    public void setFecha(int unaFecha){
        fecha=unaFecha;
    }
    public int getFecha(){
        return fecha;
    }
    
    public void setHora(int unaHora){
        hora=unaHora;
    }
    public int getHora(){
        return hora;
    }
    
}
