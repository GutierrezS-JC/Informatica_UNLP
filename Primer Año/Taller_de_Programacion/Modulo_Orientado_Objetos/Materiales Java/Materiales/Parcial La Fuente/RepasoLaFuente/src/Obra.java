/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author JuanC
 */
public class Obra {
    private String nombre;
    private String nombreDirector;
    private Actor [] vector2;

    public Obra(String nombre, String nombreDirector) {
        this.nombre = nombre;
        this.nombreDirector = nombreDirector;
        int i;
        vector2=new Actor[100];
        for(i=0;i<100;i++)
            vector2[i]=null;
    }
    public int obraMenorCantActores(){ //Punto2
        int cant=0;
        int i;
        for(i=0;i<100;i++){
            if(vector2[i]!=null)
                cant++;
        }
        return cant;
    }
    
    public int nombreDeLaObra(String nombre, String Apellido){ //Punto3
        int i=0;
        int j;
        int aux=-1;
        while(i<5){
            for(j=0;j<100;j++){
                if(vector2[j]!=null){
                    if((vector2[j].getNombre().equals(nombre))&&(vector2[j].getApellido().equals(Apellido)))
                        aux=i;
                }
            }    
            i++;
        }
        return aux;   
    }
    
    public String nombreApellidoActor(){
        int aux=-1;
        int j;
        int min=999;
        String Nombre=null;
        String Apellido=null;
            for(j=0;j<100;j++){
                if(vector2[j]!=null){
                    if((vector2[j].getEdad()>min)){
                        min=vector2[j].getEdad();
                        Nombre=vector2[j].getNombre();
                        Apellido=vector2[j].getApellido();
                    }
                }
        }
        return (Nombre+Apellido);
    }
    
    public void agregarActor(Actor A){
        int i=0;
        while((i<100)&&(vector2[i]!=null))
            i++;
        if(vector2[i]==null)
            vector2[i]=A;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    
}
