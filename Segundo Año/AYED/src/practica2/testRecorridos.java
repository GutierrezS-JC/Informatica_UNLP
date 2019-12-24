package practica2;
import arbolGeneral.*;
import ListasGenericasv2.*;

public class testRecorridos {

	public static void main(String[] args) {
		ArbolGeneral<String> a1 = new ArbolGeneral<String>("1");
		ArbolGeneral<String> a2 = new ArbolGeneral<String>("2");
		ArbolGeneral<String> a3 = new ArbolGeneral<String>("3");
		ListaGenerica<ArbolGeneral<String>> hijos = new ListaEnlazadaGenerica<ArbolGeneral<String>>();
		hijos.agregarFinal(a1); 
		hijos.agregarFinal(a2); 
		hijos.agregarFinal(a3);
		ArbolGeneral<String>  a = new ArbolGeneral<String>("0", hijos);
		ArbolGeneral<String>  a4=new ArbolGeneral<String>();
		System.out.println("Datos del Arbol: "+a.preOrden());
		System.out.println("Datos del Arbol: "+a.postOrden());
		System.out.println("Datos del Arbol: "+a.inOrden());
		System.out.println(a.esHoja());
		System.out.println(a4.esVacio());
		System.out.println(a.recorridoPorNiveles());
	}

}
