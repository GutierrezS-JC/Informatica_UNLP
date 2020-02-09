package actividad;
import arbolGeneral.*;
import ListasGenericasv2.*;

public class AnalizadorDeArbol{
	private int caminoMax=0;	
	private int caminoParcial=0;
	
	private void camino(ListaGenerica<Integer> lista,ArbolGeneral<Integer> arbol,int caminoMax, ListaEnlazadaGenerica<Integer>listaAux) {
		if(!arbol.esVacio()) {
			caminoParcial=arbol.getDatoRaiz()+caminoMax;
			listaAux.agregarFinal(arbol.getDatoRaiz());
			if(arbol.getHijos().esVacia()) {
				caminoMax=caminoParcial;
				int cant=0;
				listaAux.comenzar();
				while(!listaAux.fin()) {
				    cant=listaAux.proximo()+cant;
				}
				if(caminoMax<cant) {
					listaAux.comenzar();
					while(!listaAux.fin()) {
					    lista.agregarFinal(listaAux.proximo());
					    listaAux.eliminarEn(listaAux.tamanio());
					}
				}
			}
			ListaGenerica<ArbolGeneral<Integer>>listaHijos=arbol.getHijos();
			listaHijos.comenzar();
			while(!listaHijos.fin()) {
				this.camino(lista,listaHijos.proximo(),caminoMax,listaAux);
			}
		}
	}
	
	/*private void recorridoPreOrden (ListaEnlazadaGenerica<T> lista) {
		if(!this.esVacio()) {
			lista.agregarFinal(this.getDatoRaiz());
			ListaGenerica<ArbolGeneral<T>> listaHijos = this.getHijos();
			listaHijos.comenzar();
			while (!listaHijos.fin()) {
				listaHijos.proximo().recorridoPreOrden(lista);
			}
		}
	}*/
	
	public ListaGenerica<Integer> devolverCamino(ArbolGeneral<Integer> arbol){
		ListaGenerica<Integer> lista=new ListaEnlazadaGenerica<Integer>();
		ListaEnlazadaGenerica<Integer> listaAux=new ListaEnlazadaGenerica<Integer>();
		this.camino(lista,arbol,caminoMax,listaAux);
		return lista;
	}
}
