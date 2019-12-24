package arbolGeneral;

import ListasGenericasv2.ListaEnlazadaGenerica;
import ListasGenericasv2.ListaGenerica;
import colaGenerica.*;
//import resueltos.EvaluaciónPráctica.src.paraImportar.ArbolGeneral;


public class ArbolGeneral<T> {

	private NodoGeneral<T> raiz;

	public ArbolGeneral() {
		this.raiz = null;
	}

	public ArbolGeneral(T dato) {
		this.raiz = new NodoGeneral<T>(dato);	
	}
	
	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> lista) {

		this(dato);
		ListaGenerica<NodoGeneral<T>> hijos = new ListaEnlazadaGenerica<NodoGeneral<T>>();

		lista.comenzar();
		while (!lista.fin()) {
			ArbolGeneral<T> arbolTemp = lista.proximo();
			hijos.agregarFinal(arbolTemp.getRaiz());	
		}
		raiz.setListaHijos(hijos);
	}

	private ArbolGeneral(NodoGeneral<T> nodo) {
		this.raiz = nodo;
	}


	private NodoGeneral<T> getRaiz() {
		return this.raiz;
	}

	public T getDatoRaiz() {
		return this.raiz.getDato();
	}

	
	public ListaGenerica<ArbolGeneral<T>> getHijos() {
		ListaGenerica<ArbolGeneral<T>> lista = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		ListaGenerica<NodoGeneral<T>> hijos = (ListaGenerica<NodoGeneral<T>>) this.getRaiz().getHijos();
		lista.comenzar();
		hijos.comenzar();
		while (!hijos.fin()) {
			lista.agregarFinal(new ArbolGeneral<T>(hijos.proximo()));
			
		}
		return lista;
	}

	
	public void agregarHijo(ArbolGeneral<T> unHijo) {
		NodoGeneral<T> hijo = unHijo.getRaiz();
		this.raiz.getHijos().agregarFinal(hijo);
	}

	
	public void eliminarHijo(ArbolGeneral<T> unHijo) {
		NodoGeneral<T> hijo = unHijo.getRaiz();
		boolean ok = false;
		ListaGenerica<NodoGeneral<T>> listaHijos = (ListaGenerica<NodoGeneral<T>>)
		this.getRaiz().getHijos();
		listaHijos.comenzar();

		while (!listaHijos.fin() && !ok) {
			NodoGeneral<T> hijoTemp = listaHijos.proximo();
			if (hijoTemp.getDato().equals(hijo.getDato())) {
				ok = listaHijos.eliminar(hijoTemp);
			}
		}	
	}
	
	private void recorridoPreOrden (ListaEnlazadaGenerica<T> lista) {
		if(!this.esVacio()) {
			lista.agregarFinal(this.getDatoRaiz());
			ListaGenerica<ArbolGeneral<T>> listaHijos = this.getHijos();
			listaHijos.comenzar();
			while (!listaHijos.fin()) {
				listaHijos.proximo().recorridoPreOrden(lista);
			}
		}
	}
	
    public ListaEnlazadaGenerica<T> preOrden() {
    	ListaEnlazadaGenerica<T> lista= new ListaEnlazadaGenerica<T>();
    	this.recorridoPreOrden(lista);
    	return lista;
    }
   
	private void recorridoPostOrden(ListaEnlazadaGenerica<T> lista) {
		if(!this.esVacio()) {
			ListaGenerica<ArbolGeneral<T>> listaHijos = this.getHijos();
			listaHijos.comenzar();
			while (!listaHijos.fin()) {
				listaHijos.proximo().recorridoPostOrden(lista);
			}
			lista.agregarFinal(this.getDatoRaiz());
		}	
	}
	
    public ListaEnlazadaGenerica<T> postOrden(){
    	ListaEnlazadaGenerica<T> lista=new ListaEnlazadaGenerica<T>();
    	this.recorridoPostOrden(lista);
    	return lista;
    }
    
	private void recorridoInOrden (ListaEnlazadaGenerica<T> lista) {
		if(!this.esVacio()) {
			ListaGenerica<ArbolGeneral<T>> listaHijos = this.getHijos();
			listaHijos.comenzar();
			if(!listaHijos.fin()) {
				listaHijos.proximo().recorridoInOrden(lista);
			}
			lista.agregarFinal(this.getDatoRaiz());
			while(!listaHijos.fin()) {
				listaHijos.proximo().recorridoInOrden(lista);
			}
		}
	}
    
    public ListaEnlazadaGenerica<T> inOrden(){
    	ListaEnlazadaGenerica<T> lista=new ListaEnlazadaGenerica<T>();
    	this.recorridoInOrden(lista);
    	return lista;
    }
    
	private void porNiveles(ListaEnlazadaGenerica<T> lista) {
		ArbolGeneral<T> arbol = null;
		ColaGenerica<ArbolGeneral<T>> cola = new ColaGenerica<ArbolGeneral<T>>();
		cola.encolar(this);
		cola.encolar(null);
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				lista.agregarFinal(arbol.getDatoRaiz());
				ListaGenerica<ArbolGeneral<T>> hijos = arbol.getHijos();
				hijos.comenzar();
				while(!hijos.fin()) {
					cola.encolar(hijos.proximo());
				}
			} 
			else {
				if (!cola.esVacia() && arbol==null) {
					cola.encolar(null);
				}
			}
		}
	}
	
	/*private void recorridoPromedio(ListaEnlazadaGenerica<T> lista) {
		ArbolGeneral<T> arbol=null;
		ColaGenerica<ArbolGeneral<T>> cola= new ColaGenerica<ArbolGeneral<T>>();
		cola.encolar(this);
		cola.encolar(null);
		while(!cola.esVacia()) {
			arbol=cola.desencolar();
			if(arbol!=null) {
				int promedio=0;
				ListaGenerica<ArbolGeneral<T>>hijos=arbol.getHijos();
				hijos.comenzar();
				
			}
		}
	}
    
	public ListaEnlazadaGenerica<T> devolverPromedio(){
		ListaEnlazadaGenerica<T> lista =new ListaEnlazadaGenerica<T>();
		this.recorridoPromedio(lista);
		return lista;
	}*/
	
	public ListaEnlazadaGenerica<T> recorridoPorNiveles (){
		ListaEnlazadaGenerica<T> lista = new ListaEnlazadaGenerica<T>();
		this.porNiveles(lista);
		return lista;
	}
    
	public Integer altura() {	 
		//Falta implementar..
	   return 0;
	}

	
	public Integer nivel( T dato){
		//falta implementar
	   return -1;
	}


	public Integer ancho(){
	   //Falta implementar..
	   return 0;
	}

	public Boolean esHoja(){
		return this.getRaiz().getHijos().esVacia(); 
		
	}
	
	public Boolean esVacio(){
		return this.getRaiz()==null;
	}
}
