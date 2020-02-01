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
public class BalanzasV2 {
    private double monto;
    private int cantidad;
    private String resumen;
    
    public void setMonto(double unMonto){
        monto=unMonto;
    }
    
    public void setCantidad(int cant){
        cantidad=cant;
    }
    
    public void iniciarCompra(){
        monto=0;
        cantidad=0;
        resumen=null;
    }
    
    public void registrarProducto(Producto P, double precio){
        monto=monto+(P.getPesoEnKg()*precio);
        cantidad++;
        resumen=(resumen+P.getDescripcion()+" "+(P.getPesoEnKg()*precio)+" Pesos -");
    }
    public double devolverMontoAPagar(){
        return monto;
    }
    public String devolverResumenDeCompra(){
        return(resumen+"Total a pagar "+monto+" por la compra de "+cantidad+" productos");
    }
    
}