/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author JuanC
 */
public class Salas {
    private int nroSala;
    private int cupoEntrada;
    private int cantVendida;
    private Pelicula P;

    public Salas(int nroSala, int cupoEntrada, int cantVendida, Pelicula P) {
        this.nroSala = nroSala;
        this.cupoEntrada = cupoEntrada;
        this.cantVendida = 0;
        this.P = P;
    }
    
    public String getNombrePelicula(Pelicula P){
        return P.getNombre();
    } 
    
    public int getNroSala() {
        return nroSala;
    }
    
    public void agregarPelicula(Pelicula P){
        setP(P);
    }
    public void setNroSala(int nroSala) {
        this.nroSala = nroSala;
    }

    public int getCupoEntrada() {
        return cupoEntrada;
    }

    public void setCupoEntrada(int cupoEntrada) {
        this.cupoEntrada = cupoEntrada;
    }

    public int getCantVendida() {
        return cantVendida;
    }

    public void setCantVendida(int cantVendida) {
        this.cantVendida = cantVendida;
    }

    public Pelicula getP() {
        return P;
    }

    public void setP(Pelicula P) {
        this.P = P;
    }

   
   
    
}
