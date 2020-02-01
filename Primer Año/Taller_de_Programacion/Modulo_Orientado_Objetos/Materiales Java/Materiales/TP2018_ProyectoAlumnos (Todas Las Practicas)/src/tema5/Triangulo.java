/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;
/**
 *
 * @author JuanC
 */
public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;
    
   public Triangulo(String unColorRelleno, String unColorLinea, double unLado, double unLado2, double unLado3){
       super(unColorRelleno,unColorLinea);
       this.lado1=unLado;
       this.lado2=unLado2;
       this.lado3=unLado3;
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
   
   public double getLado1(){
       return lado1;
   }
   
   public double getLado2(){
       return lado2;
   }
   
   public double getlado3(){
       return lado3;
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
