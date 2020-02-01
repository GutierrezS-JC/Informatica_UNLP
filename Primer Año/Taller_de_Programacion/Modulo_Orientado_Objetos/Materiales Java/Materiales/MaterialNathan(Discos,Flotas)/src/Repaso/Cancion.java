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
public class Cancion {
    private int duracion;
    private String nombre;
    
    public Cancion (String unNombre,int unaDuracion){
        duracion=unaDuracion;
        nombre=unNombre;      
    }
    
    public void setDuracion(int unaDuracion){
        duracion=unaDuracion;
    }
    public int getDuracion(){
        return duracion;
    }
    public void setNombre(String unNombre){
        nombre=unNombre;
    }
    public String getNombre(){
        return nombre;
    }
    
}
