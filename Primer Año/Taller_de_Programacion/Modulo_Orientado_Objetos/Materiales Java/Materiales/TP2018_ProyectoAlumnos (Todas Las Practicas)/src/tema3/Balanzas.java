/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author JuanC
 */
public class Balanzas {
    private double monto;
    private int cantidad;
    
    public void setMonto(double unMonto){
        monto=unMonto;
    }
    
    public void setCantidad(int cant){
        cantidad=cant;
    }
    
    public void iniciarCompra(){
        monto=0;
        cantidad=0;
    }
    
    public void registrarProducto(double peso, double precio){
        monto=monto+(peso*precio);
        cantidad++;
    }
    public double devolverMontoAPagar(){
        return monto;
    }
    public String devolverResumenDeCompra(){
        return("Total a pagar "+monto+" por la compra de "+cantidad+" productos");
    }
    
}