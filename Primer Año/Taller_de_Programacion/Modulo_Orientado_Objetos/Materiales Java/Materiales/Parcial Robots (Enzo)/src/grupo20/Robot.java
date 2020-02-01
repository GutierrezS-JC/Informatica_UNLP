/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo20;
/**
 *
 * @author Alumno
 */
public abstract class Robot {
    private String nombre;
    private int avenida;
    private int calle;
    private int orientacion;
    private int cantFlores;
    private int pasosDados;
    
    public Robot(String nom, int cant){
        setNombre(nom);
        setCantFlores(cant);
        calle=0;
        avenida=0;
        orientacion=0;
        pasosDados=0;
    }
    public String getNombre() {
        return nombre;
    }

    public int getAvenida() {
        return avenida;
    }

    public int getCalle() {
        return calle;
    }

    public int getOrientacion() {
        return orientacion;
    }

    public int getCantFlores() {
        return cantFlores;
    }

    public int getPasosDados() {
        return pasosDados;
    }

    public void setNombre(String nom) {
        this.nombre = nom;
    }

    public void setAvenida(int av) {
        this.avenida = av;
    }

    public void setCalle(int Calle) {
        this.calle = Calle;
    }

    public void setOrientacion(int Orientacion) {
        this.orientacion = Orientacion;
    }

    public void setCantFlores(int cantF) {
        this.cantFlores = cantF;
    }

    public void setPasosDados(int pasos) {
        this.pasosDados = pasos;
    }
    
    public void mover(){
        if(((calle<99) && (calle>=0)) && ((avenida<99) && (avenida>=0))){
            if(orientacion==0)
                calle++; 
            else
                if(orientacion==180)
                    calle--;
                else
                    if (orientacion==90)
                        avenida++;
                    else
                        avenida--;
            pasosDados++;
        }
        else
          System.out.println("Error");
               
    }
    public void girarADerecha(){
        if (getOrientacion() < 270)
            setOrientacion(orientacion + 90);
        else
            orientacion=0;
    }
    public void sacarFlorDeLaBolsa(){
        cantFlores--;
    }
    public boolean hayFlorEnLaBolsa(){
        return (cantFlores != 0);
    }
    public abstract void depositarFlor();
    public abstract double calcularEnergiaConsumida();
    public abstract String mostrar();
}
