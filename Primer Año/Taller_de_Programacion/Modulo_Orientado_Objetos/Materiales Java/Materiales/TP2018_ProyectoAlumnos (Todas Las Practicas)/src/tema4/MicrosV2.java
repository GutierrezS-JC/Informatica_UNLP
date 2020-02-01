/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author JuanC
 */
public class MicrosV2 {
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean [] asientosOcupados;
    private int cantidadOcupados;
    int i;

    public MicrosV2(String patente, String destino, String horaSalida) {
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        cantidadOcupados=0;
        asientosOcupados= new boolean[20];
        for(i=0;i<20;i++)
            asientosOcupados[i]=false;
    }
    
    public MicrosV2(){

   }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public void ocuparAsiento(int i) {                  //Punto 5
        asientosOcupados[i]=true;
        cantidadOcupados++;
    }
    
    public int devolverCAntidadAsientosOcupaods(){              //Punto 1
        return cantidadOcupados;
    }
    
    public boolean verSiEstaLleno(){                    //Punto 2
        if(cantidadOcupados==20)
            return true;
        else
            return false;
    }
   
    public String devolverEstado(int i){                    //Punto 4
        String aux=null;
        if(asientosOcupados[i]==false)
            aux="El asiento "+i+ " esta libre";
        else if
            (asientosOcupados[i]==true)
                    aux="El asiento "+i+" esta ocupado";
        return aux;
    }
    
    public void liberarAsiento(int i){
        asientosOcupados[i]=false;
        cantidadOcupados--;
    }
    
    public int devolverPrimerAsientoLibre(){                //Punto 7 Revisar
        int j=0;
        int numeroAsiento;
        while((asientosOcupados[j]!=false )&&(j<20))
            j++;
        numeroAsiento=j;
        return numeroAsiento;
    }
}
