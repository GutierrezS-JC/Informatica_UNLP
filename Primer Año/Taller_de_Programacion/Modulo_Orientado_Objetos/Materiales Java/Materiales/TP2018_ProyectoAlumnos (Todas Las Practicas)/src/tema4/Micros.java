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
public class Micros {
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean [] vector;
    private int cantOcupados;
    
    public Micros(String patente,String destino, String horaSalida){
        this.patente=patente;
        this.destino=destino;
        this.horaSalida=horaSalida;
        cantOcupados=0;
        int i;
        vector=new boolean[20];
        for(i=0;i<20;i++)
            vector[i]=false;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }
    public int getCantOcupados(){
        return cantOcupados;
    }
    public boolean lleno(){
        return (cantOcupados==20);
    }
    public boolean ocupado(int num){
        return (vector[num]);
    }
    public void ocupar(int num){
        vector[num]=true;
        cantOcupados++;
    }
    public void liberar (int num){
        vector[num]=false;
        cantOcupados--;
    }
    public int libre(){
        int i=0;
        while ((i<20)&&(vector[i]!=false)){
            i++;}
        if (vector[i]==false)
            return i;
        else
            return -1;
    }
    public boolean valido(int num){
        return ((num>=0)&&(num<20));
    }
}
