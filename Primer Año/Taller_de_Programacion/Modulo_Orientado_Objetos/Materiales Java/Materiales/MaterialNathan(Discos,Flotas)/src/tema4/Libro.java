/*
Clase Libro a la cual se agregaron constructores. Tema 4.
 */
package tema4;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private Autor autor=new Autor(); 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor auxAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         autor=auxAutor ;
         ISBN =  unISBN;
         precio = unPrecio;
    }
    
    public Libro(  String unTitulo,  String unaEditorial, Autor auxAutor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         autor = auxAutor;
         ISBN =  unISBN;
         precio = 100;
    }
    
    public Libro(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
   
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
    
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + autor.getNombre() + autor.getBiografia()+ " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}
