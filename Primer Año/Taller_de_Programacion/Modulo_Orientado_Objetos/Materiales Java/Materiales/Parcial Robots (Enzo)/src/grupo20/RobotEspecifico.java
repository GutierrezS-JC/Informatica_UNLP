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
public class RobotEspecifico extends Robot{
    private int[][] matriz= new  int[100][100];
    // CONSTRUCTOR
    public RobotEspecifico(String nom, int cant) {
        super(nom, cant);
        int i,j;
        for (i=0;i<100;i++)
          for(j=0;j<100;j++)
            matriz[i][j]=0;    
    }
    //METODOS
    public int devolverCantFlores(){
        return(matriz[getAvenida()][getCalle()]);
    }
    public void AgregarFlor(){
        matriz[getAvenida()][getCalle()] ++;
    }
    public int devolverFloresDepositadasEnEsquina(int a, int c){
        return matriz[a][c];
    }
    public void depositarFlor(){
        setCantFlores(getCantFlores()-1);
        AgregarFlor();
    }
    public double calcularEnergiaConsumida(){
        int depositadas=0;
        int i,j;
        //calcula las depositadas
        for (i=0;i<100;i++)
          for(j=0;j<100;j++)
              depositadas =depositadas +matriz[i][j];
        double aux;
        aux= Math.sqrt (getPasosDados()+ depositadas);
        return aux;
    }
    public String mostrar(){
       String aux;
       aux= "Nombre: " + getNombre() + " Avenida: " + getAvenida() + " Calle: " + getCalle() +
               " Orientacion: " + getOrientacion()+ " Flores en Bolsa: " + getCantFlores() + 
               " Pasos Dados: " + getPasosDados()+ " Energia Consumida: " + calcularEnergiaConsumida();
       return aux;
    }
}

    
