/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo20;
/**
 *
 * @author Alumno
 */
public class RobotGeneral extends Robot {
    private int floresDepositadas;
    
    public RobotGeneral(String nom, int cant) {
        super(nom, cant);
        this.floresDepositadas = 0;
    }

    public int getFloresDepositadas() {
        return floresDepositadas;
    }
    
    public void setFloresDepositadas(int floresD) {
        this.floresDepositadas = floresD;
    }
    public void depositarFlor(){
        setCantFlores(getCantFlores()-1);
        floresDepositadas++;
    }
    public double calcularEnergiaConsumida(){
        return (getPasosDados()*0.15 + getCantFlores()* 0.20);
    }
    public String mostrar(){
       String aux;
       aux= "Nombre: " + getNombre() + " Avenida: " + getAvenida() + " Calle: " + getCalle() +
               " Orientacion: " + getOrientacion()+ " Flores en Bolsa: " + getCantFlores() + 
               " Pasos Dados: " + getPasosDados()+ " Energia Consumida: " + calcularEnergiaConsumida();
       return aux;
    }
}