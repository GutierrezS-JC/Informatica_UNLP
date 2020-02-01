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
public class Combi extends Vehiculo{
    
    
    private String [] destinos;
    private int cantAsientos;

    public Combi(String[] destinos, int cantAsientos, String Marca, String Modelo, String Matricula, double MontoXKM){
       
        super(Marca, Modelo, Matricula, MontoXKM);
        this.destinos = destinos;
        this.cantAsientos = cantAsientos;
    }
     

    public String[] getDestinos() {
        return destinos;
    }

    public void setDestinos(String[] destinos) {
        this.destinos = destinos;
    }

    public int getCantAsientos() {
        return cantAsientos;
    }

    public void setCantAsientos(int cantAsientos) {
        this.cantAsientos = cantAsientos;
    }
    
    public boolean combiViajeDeterminado(String destino){
        int i=0; boolean ok=false;
        
        while((i<10) && (!ok)){
            if(destinos[i].equals(destino)){
                ok=true;
            }
            else
                i++;
        }
    
        return ok;
    }
    
    public double calcularMontoViaje(double kms){
        double monto=0; int i=0; boolean encontrado=false;
        
        while(i<10 && !encontrado){
            if((destinos[i]!=null)  && (destinos[i].equals("avellaneda"))){
                encontrado=true;
                monto=kms* super.getMontoxKm();
            }
            else
                i++;
                
        }
        
        if(encontrado==false){
            if(kms<=15)
                monto=200;
            else
                if(kms>15)
                    monto= (double)5000/cantAsientos;
        }
        
       return monto; // monto a devolver
        
    }
    
  
    
    
}
