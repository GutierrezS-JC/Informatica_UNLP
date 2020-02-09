package practica2;
import arbolBinario.*;
import ListasGenericasv2.ListaEnlazadaGenerica;

public class ContadorArbol {
	ArbolBinario<Integer> arbol;
	
	public ContadorArbol(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	
	public ListaEnlazadaGenerica<Integer> numerosParesEnOrden(ArbolBinario<Integer>arbol) {
		ListaEnlazadaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		if(this.arbol.esVacio()) {
			return null;
		}
		numerosParesEnOrden(arbol.getHijoIzquierdo());
		if((arbol.getDatoRaiz()%2)==0) {
			lista.agregarFinal(arbol.getDatoRaiz());
			return lista;
		}
		return numerosParesEnOrden(arbol.getHijoDerecho());
	}

}
