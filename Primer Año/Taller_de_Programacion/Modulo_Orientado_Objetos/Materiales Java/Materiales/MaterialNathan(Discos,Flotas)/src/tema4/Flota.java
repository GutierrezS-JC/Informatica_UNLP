/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Nat
 */
public class Flota {
    Micro vector[]= new Micro[15];
    
    public Flota(){
        int i;
        for (i=0;i<15;i++){
            vector[i]=null;
        }
}
    public boolean estaCompleta(){
        int i;
        int aux=0;
        for(i=0;i<15;i++){
            if (vector[i]!=null){
                aux++;
            }
        }
        if(aux==15){
            return true;
        }
        else return false;
    }
    
    public void agregarFlota(Micro m){
        int i=0;
        while ((vector[i]!=null)&&(i<15)){
            i++;
        }
        vector[i]=m;
    }
    
    public void eliminarPatente(String auxPatente){
        int i=0;
        int j;
        while((i<15)&&(!vector[i].getPatente().equals(auxPatente))){
        i++;
        }
        if((i<15)&&(vector[i].getPatente().equals(auxPatente))){
            for (j=i;j<15;j++){
            vector[j]=vector[j++];
            }
        }
        
    }
    
    public Micro retornarMicroPatente(String auxPatente){
        int i=0;
        while((i<15)&&(!vector[i].getPatente().equals(auxPatente))){
        i++;
        }
        if((i<15)&&(vector[i].getPatente().equals(auxPatente))){
            return vector[i];
        }   
        else return null;
    }
    
    public Micro retornarMicroDestino(String auxDestino){
        int i=0;
        while((i<15)&&(!vector[i].getDestino().equals(auxDestino))){
        i++;
        }
        if((i<15)&&(vector[i].getDestino().equals(auxDestino))){
            return vector[i];
        }   
        else return null;
    }
    
    
}    

