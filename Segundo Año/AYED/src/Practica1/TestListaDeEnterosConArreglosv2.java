package Practica1;
import ListasDeEnteros.*;
import java.util.Scanner;
public class TestListaDeEnterosConArreglosv2 {

	public static void main(String[] args) {
		int a;
		ListaDeEnterosConArreglos lista=new ListaDeEnterosConArreglos();
		System.out.println("Ingrese los numeros que desee ingresar en el arreglo kjjj");
		System.out.println("-1 para finalizar");
		Scanner in=new Scanner(System.in);
		lista.comenzar();
		a=in.nextInt();
		while(a!=-1) {
			lista.agregarFinal(a);
			System.out.println("Ingrese otro numero");
			a=in.nextInt();
		}
		lista.comenzar();
		while(!lista.fin()) {
			System.out.println(lista.proximo());
		}
		in.close();
	}

}
