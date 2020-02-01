/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author alumnos
 */
public class Flotas {
    private Micros [] vector;
    private int cant;
            
    public Flotas(){
        int i;
        for (i=0;i<15;i++)
            vector[i]=null;
        cant=0;
    }
    
    public boolean completa(){
        return (cant==15);
    }
    
    public void agregarMicro(Micros M){
        if(this.completa()==false){
        vector[cant]=M;
        cant++;}
    }
    public void eliminarMicro (String S){
        int j;
        if (cant!=0){
            int i=0;
        while ((i<15)&&(S!=vector[i].getPatente())){
            i++;}
        if (S==vector[i].getPatente())
            for(j=i;j<14;j++)
                vector[j]=vector[j+1];
                
        cant--;
        }            
    }
    public Micros buscarPatente (String S){
        int i=0;
        while ((i<15)&&(S!=vector[i].getPatente())){
            i++;}
        if (S==vector[i].getPatente())
            return vector[i];
        else
            return null;
    }
    public Micros buscarDestino (String S){
        int i=0;
        while ((i<15)&&(S!=vector[i].getDestino())){
            i++;}
        if (S==vector[i].getDestino())
            return vector[i];
        else
            return null;
    }
}
