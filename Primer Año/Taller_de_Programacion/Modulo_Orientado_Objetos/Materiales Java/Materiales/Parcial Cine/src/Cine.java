/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author JuanC
 */
public class Cine {
    private String nombre;
    private String direccion;
    private String nombreDueno;
    private Salas vector[];

    public Cine(String nombre, String direccion, String nombreDueno) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.nombreDueno = nombreDueno;
        vector=new Salas[5];
        int i;
        for(i=0;i<5;i++)
            vector[i]=null;
    }
    public void agregarSalas(Salas S){
        int i=0;
        while((vector[i]!=null)&&(i<5))
            i++;
        if(vector[i]==null)
            vector[i]=S;
    }
    public void ventaYDevoludcionDeEntradas(int i){
        if(vector[i].getCupoEntrada()>0){
        vector[i].setCantVendida(vector[i].getCantVendida()+1);
        vector[i].setCupoEntrada(vector[i].getCupoEntrada()-1);
        }
    }
    
    public boolean hayEntradas(int i){       //Punto 1
        if(vector[i].getCupoEntrada()>0)
            return true;
        else
            return false;
    }
    
    public int enQueSalaSeProyecta(String nombrePeli){      //punto2
        int i=0;
        int aux=-1;
        while(i<5){
            if(!vector[i].getNombrePelicula(vector[i].getP()).equals(nombrePeli))
                i++;
        }
        if(vector[i].getNombrePelicula(vector[i].getP()).equals(nombrePeli))
            aux=i;
        return aux;
    }
    
    public int salaConMayorCantidadEntradasVendidas(){  //punto3 //DEVOLVER CLASES, PELICULA, SALAS ETC
        int i=0;
        int aux=-1;
        int min=-999;
        while(i<5){
            if(vector[i].getCantVendida()>min){
                min=vector[i].getCantVendida();
                aux=i;
                i++;
            }
        }
        return aux;
    }
    
    public String nombrePeliQueMasEntradasVendio(){ //punto4
        int i=0;
        String aux2=null;
        int aux=salaConMayorCantidadEntradasVendidas();
        aux2=vector[aux].getNombrePelicula(vector[aux].getP());
        return aux2;
    }
            
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombreDueno() {
        return nombreDueno;
    }

    public void setNombreDueno(String nombreDueno) {
        this.nombreDueno = nombreDueno;
    }
    
    
    
    
}
