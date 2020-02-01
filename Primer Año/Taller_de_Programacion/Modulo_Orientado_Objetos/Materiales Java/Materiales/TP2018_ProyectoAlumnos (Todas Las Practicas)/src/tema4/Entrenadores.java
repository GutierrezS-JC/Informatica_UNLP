/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author JuanC
 */
public class Entrenadores {
    private String nombre;
    private double sueldoBasico;
    private int cantCampeonatosGanados;

    public Entrenadores(String unNombre, double unSueldoBasico, int unaCantCampeonatosGanados) {
        nombre = unNombre;
        sueldoBasico = unSueldoBasico;
        cantCampeonatosGanados = unaCantCampeonatosGanados;
    }

    public Entrenadores() {
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }
    
    public double calcularSueldoACobrar(){
        if((getCantCampeonatosGanados()>=1) && (getCantCampeonatosGanados()<=4))
            return getSueldoBasico()+5000;  
        else if((getCantCampeonatosGanados()>=5)&& (getCantCampeonatosGanados()<=10))
            return getSueldoBasico()+30000;
        else if (getCantCampeonatosGanados()>10)
            return getSueldoBasico()+50000;
        else
            return getSueldoBasico();
    }
}
