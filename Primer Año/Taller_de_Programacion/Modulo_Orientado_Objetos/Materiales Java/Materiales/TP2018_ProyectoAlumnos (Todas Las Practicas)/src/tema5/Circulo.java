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
public class Circulo extends Figura {
    private double radio;

    public Circulo(String unCR, String unCL, double radio) {
        super(unCL, unCR);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
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
