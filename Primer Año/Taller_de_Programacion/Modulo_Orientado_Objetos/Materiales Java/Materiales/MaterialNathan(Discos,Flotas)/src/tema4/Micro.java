/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Alumno
 */
public class Micro {
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean asientos[]=new boolean[20];
    private int asientosOcupados;
    
    public Micro(String auxPatente, String auxDestino,String auxHoraSalida){
        patente=auxPatente;
        destino=auxDestino;
        horaSalida=auxHoraSalida;
        int i;
        for(i=0;i<20;i++){
            asientos[i] =false;
        }        
        asientosOcupados=0;
    }
    //sets y gets de las variables de instacia del objeto.   
    public void setPatente(String auxPatente){
        patente=auxPatente;
    }
    public String getPatente(){
        return patente;
    }
    public void setDestino(String auxDestino){
        destino=auxDestino;
    }
    public String getDestino(){
        return destino;
    }
    public void setHoraSalida(String auxHoraSalida){
        horaSalida=auxHoraSalida;
    } 
    public String getHoraSalida(){
        return horaSalida;
    }
    public int getAsientosOcupados(){
        int i;
        int cant=0;
        for(i=0;i<20;i++){
            if(asientos[i]==true){
                cant=cant+1;
            }
        }
        return cant;
    }
    public boolean verEstadoLleno(){
        int i;
        int cant=0;
        for(i=0;i<20;i++){
            if(asientos[i]==true){
                cant=cant+1;
            }
        }
        boolean aux=false;
        if(cant==20){    
            aux=true;
        }
        return aux;
    }
    
    public boolean validarAsiento(int auxAsiento){
        boolean aux=false;
        if((auxAsiento>=0) && (auxAsiento<20)){
            aux=true;
        }
        return aux;       
    }
    
    public boolean comprobarNroAsiento(int auxAsiento){
        return asientos[auxAsiento];
    }
    
    public void ocuparAsiento(int auxAsiento){
        asientos[auxAsiento]=true;
    }
    
    public void liberarAsiento(int auxAsiento){
        asientos[auxAsiento]=false;
    }
    
    public int primeroLibre(){
        int i=0;
        int pos=-1;
        boolean aux=false;
        while((i<20) && (aux==false)){
            if(asientos[i]==true){
                aux=true;
                pos=i;
            }
            i++;
        }
        return pos;        
    }   
}
