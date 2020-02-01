/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

/**
 *
 * @author JuanC
 */
public class Funciones {
    private String titulo;
    private String fecha;
    private String hora;
    private Espectadores [][] matriz;
    private int []vector;

    public Funciones(String titulo, String fecha, String hora) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.matriz=new Espectadores[20][10];
        this.vector=new int[20];
        int i,j;
        for(i=0;i<20;i++) //numero de filas
            for(j=0;j<10;j++)//numero de columnas
                matriz[i][j]=null; //Inicializo la matriz sin espectadores
        for(int v=0;v<20;v++)  //inicializo el vector sin asientos ocupados en las filas
            vector[v]=0;
    }
    
    public boolean validarFila(int F){
        if((F>=0)&&(F<20))
            return true;
        else
            return false;
    }
    
    public boolean hayButacaLibreEnFila(int F){
        int i=0;
        if(validarFila(F)==true){
            while((matriz[F][i]!=null)&&(i<10)){
                i++;}}
        if(matriz[F][i]==null)
            return true;
        else
            return false;
    }
    
    public boolean hayButacaLibreEnFilaConVector(int F){
        boolean aux=false;
        if(validarFila(F)==true){
            if(vector[F]<10)
                aux= true;
            }
        if(aux==true)
            return true;
        else             
            return false;
    }
    
    public int agregarEspectadorAFila(int F, Espectadores E){
        int i=0;
        if(validarFila(F)==true)
            while((matriz[F][i]!=null)&&(i<10))
                i++;
        if(matriz[F][i]==null)
            matriz[F][i]=E;
        return i;   
    }
    public int agregarEspectadorAFilaConVector(int F,Espectadores E){
        int i=0;
        if((validarFila(F)==true)&&(hayButacaLibreEnFilaConVector(F))){
            while((matriz[F][i]!=null)&&(i<10))
                i++;
            if(matriz[F][i]==null){
                matriz[F][i]=E;
                vector[F]=vector[F]+1;} 
    }
        return i;
    }
    
    public int calcularButacasLibres(){
        int cant=0;
        int i,j;
        for (i=0;i<20;i++)
            for(j=0;j<10;j++)
                if(matriz[i][j]==null)
                    cant++;
        return cant;
    }
    
    public int calcularButacasLibresConVector(){
        int cant=0;
        int i;
        for(i=0;i<20;i++)
            cant=cant+vector[i];
        return(200-cant);
    }
    
    public double calcularEdadPromEspectadores(){
        int i,j;
        double cantEspectadoresRegistrados=0;
        double cantTotalEdades=0;
        double promedio;
        for (i=0;i<20;i++){
            for(j=0;j<10;j++){
                if(matriz[i][j]!=null){
                    cantEspectadoresRegistrados++;
                    cantTotalEdades=cantTotalEdades+matriz[i][j].getEdad();
                }
            }
        }
        promedio=(cantTotalEdades/cantEspectadoresRegistrados);
        return promedio;
    }
    
    public boolean estaRegistradoEspectador(int D){
        int F;
        int C;
        boolean aux=false;
        for(F=0;F<20;F++)
            for(C=0;C<10;C++)
                if(matriz[F][C].getDNI()==D)
                    aux=true;
        if(aux==true)
            return true;
        else
            return aux;
    }
    
    public boolean estaRegistradoEspectador3(int D){
        boolean aux=false;
        int F;
        int C;
        for(F=0;F<20;F++){
            for(C=0;C<10;C++){
                if(matriz[F][C]!=null){
                    if(matriz[F][C].getDNI()==D)
                        aux=true;
                }
            }
        }
        return aux;
    }
            

     public boolean estaRegistradoEspectador2 (int unNro){
        boolean ok = false;
        int i=0,j=0;
        while (matriz[i][j].getDNI() != unNro){
            while (matriz[i][j].getDNI() != unNro)
                j++;
            i++;
        }
        if (matriz [i][j].getDNI() == unNro)
            ok = true;
        return ok;
    }
            
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
}
