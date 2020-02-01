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
public class Banda {
    private String nombre;
    private String tipo;
    private String ciudadCreacion;
    private Disco[]Discos=new Disco[20];
    
    public Banda(String unNombre,String unTipo,String unaCiudadCreacion){
        nombre=unNombre;
        tipo=unTipo;
        ciudadCreacion=unaCiudadCreacion;  
        int i;
        for(i=0;i<20;i++){
            Discos[i]=null;
        }
    }
    public void setNombre(String unNombre){
        nombre=unNombre;        
    }
    public String getNombre(){
        return nombre;
    }
    public void setTipo(String unTipo){
        tipo=unTipo;
    }
    public String getTipo(){
        return tipo;
    }
    public void setCiudadCreacion(String unaCiudadCreacion){
        ciudadCreacion=unaCiudadCreacion;
    }
    public String getCiudadCreacion(){
        return ciudadCreacion;
    }
    public void agregarDisco(Disco D){
        int i=0;
        while((Discos[i]!=null)&&(i<25)){
            i++;
        }
        if(i<25){
            Discos[i]=D;
        }
        else
            System.out.println("no se puede agregar el disco");
    }
}
