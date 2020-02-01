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
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularArea(){
        double aux;
        double aux2;
        aux=Math.pow(getRadio(),2);
        aux2=(Math.PI*aux);
        return aux2;
    }
    
    public double calcularPerimetro(){
        return (2*(Math.PI*getRadio()));
    }
}
