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
public class Jugadores extends Empleado{
    private int cantPartidosJugados;
    private int cantGolesAnotados;
    
    public Jugadores(String nombre, double sueldoBasico, int cantPartidosJugados, int cantGolesAnotados){
        super(nombre,sueldoBasico);
        this.cantPartidosJugados=cantPartidosJugados;
        this.cantGolesAnotados=cantGolesAnotados;
    }

    public int getCantPartidosJugados() {
        return cantPartidosJugados;
    }

    public void setCantPartidosJugados(int cantPartidosJugados) {
        this.cantPartidosJugados = cantPartidosJugados;
    }

    public int getCantGolesAnotados() {
        return cantGolesAnotados;
    }

    public void setCantGolesAnotados(int cantGolesAnotados) {
        this.cantGolesAnotados = cantGolesAnotados;
    }
    
    public boolean promedio(){
        if((getCantGolesAnotados()/getCantPartidosJugados())>(2/4))
            return true;
        else
          return false;
    }

    public double calcularSueldoACobrar() {
        if (promedio()==true)
            return (getSueldoBasico()*2);
        else
            return getSueldoBasico();
    }
    
    
}
