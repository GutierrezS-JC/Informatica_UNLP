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
public class Espectadores {
    private String nombre;
    private int dni;
    private int edad;
    
    //sets y gets de las vi nombre dni edad.
    public Espectadores(String unNombre,int unDni,int unaEdad){
        nombre=unNombre;
        dni=unDni;
        edad=unaEdad;
    }
    
    public void setNombre(String unNombre){
        nombre=unNombre;
    }
    public String getNombre(){
        return nombre;
    }
    
    public void setDni(int unDni){
        dni=unDni;
    }
    public int getDni(){
        return dni;
    }
    
    public void setEdad (int unaEdad){
        edad=unaEdad;
    }
    public int getEdad(){
        return edad;
    }
    
}
