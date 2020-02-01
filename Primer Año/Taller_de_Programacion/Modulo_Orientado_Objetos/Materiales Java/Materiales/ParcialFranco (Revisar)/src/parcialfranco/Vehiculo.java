
package parcialfranco;


public abstract class Vehiculo {
    private String marca ;
    private String modelo ;
    private String matricula ;
    private double montoxKm ;
    
   Vehiculo(String Marca, String Modelo, String Matricula , double MontoXKM){
       marca=Marca;
       modelo=Modelo;
       matricula=Matricula;
       montoxKm=MontoXKM;
   } 
    
    

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public double getMontoxKm() {
        return montoxKm;
    }

    public void setMontoxKm(double montoxKm) {
        this.montoxKm = montoxKm;
    }
    
    public abstract double calcularMontoViaje(double kms);
    

    
    
}
