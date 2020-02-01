/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso2;

/**
 *
 * @author Nat
 */
public class Cine {
    private String nombre;
    private String dir;
    private String nombreD;
    private Sala salas[]=new Sala[5];

    public Cine(String nombre, String dir, String nombreD) {
        this.nombre = nombre;
        this.dir = dir;
        this.nombreD = nombreD;
        int i;
        for(i=0;i<5;i++){
            salas[i]=null;
        }
    }
    
    public void agregarSala(Sala S){
        int i=0;
        while((i<5)&&(salas[i]!=null)){
            i++;
        }
        if(i<5){
            salas[i]=S;
        }
    }
    
    public void setNombre(String unNombre){
        nombre=unNombre;
    }
    public String getNombre(){
        return nombre;
    }
    
    public void setDir(String unaDir){
        dir=unaDir;
    }
    public String getDir(){
        return dir;
    }

    public String getNombreD() {
        return nombreD;
    }

    public void setNombreD(String nombreD) {
        this.nombreD = nombreD;
    }

    public void ventaEntrada(Sala Sa){
        int i=0;
        while((i<5)&&(salas[i].getNumSala()!=Sa.getNumSala())){
            i++;
        }
        if(salas[i].getNumSala()==Sa.getNumSala()){
            salas[i].setCantV(salas[i].getCantV()+1);
        }
    }
    
    public void devolucionEntrada(Sala Sa){
        int i=0;
        while((i<5)&&(salas[i].getNumSala()!=Sa.getNumSala())){
            i++;
        }
        if(salas[i].getNumSala()==Sa.getNumSala()){
            salas[i].setCantV(salas[i].getCantV()-1);
        }
    }
   
    public boolean verDisponibles(int numSala){
        int i=0;
        boolean aux=false;
        while((i<5)&&(salas[i].getNumSala()!=numSala)){
            i++;
        }
        if(salas[i].getNumSala()==numSala){
            if(salas[i].getCupoEntradas()>salas[i].getCantV()){
                aux=true;
            }
        }
        return aux;
    }
    
    public int salaProyecta(String nomPeli){
        int i=0;
        Pelicula P=new Pelicula();
        while((i<5)&&(!P.getNombre().equals(nomPeli))){
            P=salas[i].getPelicula();
            i++;
        }
        if(P.getNombre().equals(nomPeli)){
            return salas[i].getNumSala();       
        }
        else return -1;
    }
    
    public Sala salaMayorVendida(){
        int cont=-1;
        int aux=0;
        int i=0;
        while((i<5)){
            if((salas[i].getCantV())>cont){
                cont=salas[i].getCantV();
                aux=i;
            }
            i++;
        }
        return salas[aux];
    }
  
        public Pelicula peliculaMayorVendida(){
        int cont=-1;
        Pelicula aux=new Pelicula();
        int i=0;
        while((i<5)){
            if((salas[i].getCantV())>cont){
                cont=salas[i].getCantV();
                aux=salas[i].getPelicula();
            }
            i++;
        }
        return aux;
    }
    
        
}
