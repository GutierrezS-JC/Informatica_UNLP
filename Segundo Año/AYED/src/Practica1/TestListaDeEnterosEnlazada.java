package Practica1;
import java.util.Scanner;
import ListasDeEnteros.ListaDeEnterosEnlazada;

public class TestListaDeEnterosEnlazada {

	public static void main(String[] args) {
		int a;
		ListaDeEnterosEnlazada lista=new ListaDeEnterosEnlazada();
		System.out.println("Ingrese los numeros que desee ingresar en el arreglo kjjj");
		System.out.println("-1 para finalizar");
		Scanner in=new Scanner(System.in);
		lista.comenzar();
		a=in.nextInt();
		while(a!=-1) {
			lista.agregarFinal(a);
			System.out.print("Ingrese otro numero: ");
			a=in.nextInt();
		}
		System.out.println("----------------------------------");
		System.out.println("Se procede a imprimir la lista");
		lista.comenzar();
		while(!lista.fin()) {
			System.out.print(lista.proximo()+" ");
		}
		in.close();
	}

}
