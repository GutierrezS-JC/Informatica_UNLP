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
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
   public Triangulo(double unLado, double unLado2, double unLado3, String unColorRelleno, String unColorLinea ){
       lado1=unLado;
       lado2=unLado2;
       lado3=unLado3;
       colorRelleno=unColorRelleno;
       colorLinea=unColorLinea;
   }
   
   public Triangulo(){
       
   }

   public void setLado1(double unLado1){
       lado1= unLado1;
   }
   
   public void setLado2(double unLado2){
       lado2=unLado2;
   }
   
   public void setLado3(double unLado3){
       lado3=unLado3;
   }
   
   public void setColorRelleno(String colorR){
       colorRelleno=colorR;
   }
   
   public void setColorLinea(String colorL){
       colorLinea=colorL;
   }
   
   public double getLado1(){
       return lado1;
   }
   
   public double getLado2(){
       return lado2;
   }
   
   public double getlado3(){
       return lado3;
   }
   
   public String getColorRelleno(){
       return colorRelleno;
   }
   
   public String getColorLinea(){
       return colorLinea;
   }
   
   public double calcularArea(){
       double s= (lado1+lado2+lado3)/2;
       double area= s*(s-lado1)*(s-lado2)*(s-lado3);
       return(Math.sqrt(area));   
   }
   
   public double calcularPerimetro(){
       double perimetro;
       perimetro=lado1+lado2+lado3;
       return perimetro;
   }
}
