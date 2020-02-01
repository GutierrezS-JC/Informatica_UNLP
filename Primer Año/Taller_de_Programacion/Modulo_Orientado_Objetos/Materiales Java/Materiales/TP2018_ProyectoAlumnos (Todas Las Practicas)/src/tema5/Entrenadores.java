/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author JuanC
 */
public class Entrenadores extends Empleado {
    private int cantCampeonatosGanados;

    public Entrenadores(String nombre, double sueldoBasico,int cantCampeonatosGanados) {
        super(nombre, sueldoBasico);
        this.cantCampeonatosGanados=cantCampeonatosGanados;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }
    
    public double calcularSueldoACobrar(){
        if((getCantCampeonatosGanados()>=1)&&(getCantCampeonatosGanados()<=4))
            return (getSueldoBasico()+5000);
        else if((getCantCampeonatosGanados()>=5)&&(getCantCampeonatosGanados()<=10))
            return(getSueldoBasico()+30000);
        else if(getCantCampeonatosGanados()>10)
            return (getSueldoBasico()+50000);
        else
            return getSueldoBasico();
    }
}
