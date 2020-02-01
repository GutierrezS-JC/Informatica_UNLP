/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialfranco;

/**
 *
 * @author alumnos
 */
public class Remisse extends Vehiculo {
    private int nroLicencia;
    private String localidadHabilitacion;
    private Double montoMinViaje;

    public Remisse(String Marca,String modelo, String matricula , double montoXKm,int nroLicencia, String localidadHabilitacion, Double montoMinViaje) {
        super(Marca,modelo,matricula,montoXKm);
        
        this.nroLicencia = nroLicencia;
        this.localidadHabilitacion = localidadHabilitacion;
        this.montoMinViaje = montoMinViaje;
    }
    
    
    

    public int getNroLicencia() {
        return nroLicencia;
    }

    public void setNroLicencia(int nroLicencia) {
        this.nroLicencia = nroLicencia;
    }

    public String getLocalidadHabilitacion() {
        return localidadHabilitacion;
    }

    public void setLocalidadHabilitacion(String localidadHabilitacion) {
        this.localidadHabilitacion = localidadHabilitacion;
    }

    public Double getMontoMinViaje() {
        return montoMinViaje;
    }

    public void setMontoMinViaje(Double montoMinViaje) {
        this.montoMinViaje = montoMinViaje;
    }


    public double calcularMontoViaje(double kms) {
        double monto;
        monto=kms*(super.getMontoxKm());
        return monto;//monto a devolver
    }
    
    
    
    
    
}
