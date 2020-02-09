package ejercicio2;

import ListasGenericasv2.ListaEnlazadaGenerica;
import ListasGenericasv2.ListaGenerica;
import arbolGeneral.ArbolGeneral;

public class Test {

	public static void main(String[] args) {
		ArbolGeneral<Integer> a1 = new ArbolGeneral<Integer>(3);
		ArbolGeneral<Integer> a2 = new ArbolGeneral<Integer>(5);
		ArbolGeneral<Integer> a3 = new ArbolGeneral<Integer>(7);
		ArbolGeneral<Integer> a4 = new ArbolGeneral<Integer>(9);
		ArbolGeneral<Integer> a5 = new ArbolGeneral<Integer>(3);
		ArbolGeneral<Integer> a6 = new ArbolGeneral<Integer>(5);
		ArbolGeneral<Integer> a7 = new ArbolGeneral<Integer>(7);
		ArbolGeneral<Integer> a8 = new ArbolGeneral<Integer>(9);
		ListaGenerica<ArbolGeneral<Integer>> hijos = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos.agregarFinal(a1); 
		hijos.agregarFinal(a2); 
		hijos.agregarFinal(a3);
		hijos.agregarFinal(a4);
		hijos.agregarFinal(a5); 
		hijos.agregarFinal(a6); 
		hijos.agregarFinal(a7);
		hijos.agregarFinal(a8);
		ArbolGeneral<Integer>  a = new ArbolGeneral<Integer>( 4, hijos);
		ListaGenerica<Integer> lista= new ListaEnlazadaGenerica<Integer>();
		AnalizadorDeArbol analizador=new AnalizadorDeArbol();
		lista=analizador.elementosEnRango(a, 5, 10);
		lista.comenzar();
		while(!lista.fin()) {
			System.out.println(lista.proximo());
		}

	}

}
