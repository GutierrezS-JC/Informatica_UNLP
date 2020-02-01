/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Nat-PC
 */
public class Autor {
    private String nombre;
    private String biografia;    

    public Autor(String auxNombre,String auxBiografia){
        nombre= auxNombre;
        biografia= auxBiografia;
    }
    public Autor(){
        
    }
    public void setNombre(String auxNombre){
        nombre= auxNombre;
    }
    public String getNombre(){
        return nombre;
    }
    public void setBiografia(String auxBiografia){
        biografia= auxBiografia;
    } 
    public String getBiografia(){
        return biografia;
    }
}
