/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author JuanC
 */
public class Teatro {
    private String nombre;
    private String direccion;
    private String nombreDueno;
    private Obra [] vector;

    public Teatro(String nombre, String direccion, String nombreDueno) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.nombreDueno = nombreDueno;
        vector=new Obra[5];
        int i;
        for(i=0;i<5;i++)
            vector[i]=null;
    }
    
    public void agregarObras(Obra O){
        int i=0;
        while((vector[i]!=null)&&(i<5))
            i++;
        if(vector[i]==null)
            vector[i]=O;
    }
    public String punto1(String nombreObra){
        int i=0;
        while((i<5)&&(!vector[i].getNombre().equals(nombreObra)))
            i++;
        if(vector[i].getNombre().equals(nombreObra))
            return vector[i].getNombreDirector();  
        else
            return null;
    }
    public Obra punto2(){
        Obra obraMinima=null;
        int i=0;
        int min=999;
        while((i<5)&&(vector[i].obraMenorCantActores()<min)){
            min=vector[i].obraMenorCantActores();
            obraMinima=vector[i];
            i++;
        }
        return obraMinima;
    }
    
    public String punto3(String nombre, String Apellido){
        int i=0;
        String nombreObra="No se encontro la obra";
        while((i<5)&&(vector[i].nombreDeLaObra(nombre, Apellido)>-1)&&(vector[i].nombreDeLaObra(nombre, Apellido)<5)){
            nombreObra=vector[i].getNombre();
        }
        return nombreObra;
    }
    
    public String punto4(){
        int i=0;
        String aux=null;
        while(i<5){
            aux=vector[i].nombreApellidoActor();
            i++;
        }
        return aux;
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
