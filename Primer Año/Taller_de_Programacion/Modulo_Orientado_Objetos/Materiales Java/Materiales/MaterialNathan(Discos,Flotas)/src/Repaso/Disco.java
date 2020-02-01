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
public class Disco {
    private String nombre;
    private Cancion[]vector=new Cancion [25];
    private int fechaLanzamiento;
    
    public Disco(String unNombre,int unaFechaLanzamiento){
        nombre=unNombre;
        fechaLanzamiento=unaFechaLanzamiento;
        int i;
        for(i=0;i<25;i++){
            vector[i]=null;
        }
    }
    
    public void setNombre(String unNombre){
        nombre=unNombre;        
    }
    public String getNombre(){
        return nombre;
    }
    
    public void setFechaLanzamiento(int unaFechaLanzamiento){
        fechaLanzamiento=unaFechaLanzamiento;        
    }
    public int getFechaLanzamiento(){
        return fechaLanzamiento;
    }
    
    public void agregarCancion(Cancion C){
        int i=0;
        while((vector[i]!=null) && (i <25)){
            i++;
        }
        if (i<25){
            vector[i]=C;
        }
        else 
            System.out.println("no se puede agregar la cancion");     
    }
}
