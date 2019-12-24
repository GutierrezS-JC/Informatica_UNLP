package arbolBinario;

import ListasGenericasv2.*;

import arbolBinario.ArbolBinario;
import arbolBinario.NodoBinario;
import genericos.ColaGenerica;
public class ArbolBinario<T> {

	private NodoBinario<T> raiz;

	public ArbolBinario(T dato) {
		this.raiz = new NodoBinario<T>(dato);
	}

	private ArbolBinario(NodoBinario<T> nodo) {
		this.raiz = nodo;
	}

	private NodoBinario<T> getRaiz() {
		return raiz;
	}

	public T getDatoRaiz() {
		if (this.getRaiz() != null) {
			return this.getRaiz().getDato();
		} else {
			return null;
		}
	}

	public ArbolBinario<T> getHijoIzquierdo() {
		return new ArbolBinario<T>(this.raiz.getHijoIzquierdo());
	}

	public ArbolBinario<T> getHijoDerecho() { 
		return new ArbolBinario<T>(this.raiz.getHijoDerecho());
	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.raiz.setHijoIzquierdo(hijo.getRaiz());
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.raiz.setHijoDerecho(hijo.getRaiz());
	}

	public void eliminarHijoIzquierdo() {
		this.raiz.setHijoIzquierdo(null);
	}

	public void eliminarHijoDerecho() {
		this.raiz.setHijoDerecho(null);
	}

	public boolean esVacio() {
		return this.getDatoRaiz() == null;
	}

	public boolean esHoja() {
		return this.getDatoRaiz() != null && this.getHijoIzquierdo().esVacio() && this.getHijoDerecho().esVacio();
	}
	
	public int contarHojas(ArbolBinario<T> arbol) {
		int contador;
		if(arbol.esVacio()) {
			return 0;
		}
		else
			if(arbol.getHijoIzquierdo().esVacio()&& arbol.getHijoDerecho().esVacio()){
				return 1;
			}
			else
				contador=this.contarHojas(arbol.getHijoIzquierdo())+this.contarHojas(arbol.getHijoDerecho());
		return contador;
	}
	
	public ArbolBinario<T> espejo(ArbolBinario<T> a){
		if(a.esVacio()) {
			return new ArbolBinario<T>((T) null);
		}
		else {
			ArbolBinario<T> espejoHI=a.espejo(a.getHijoIzquierdo());
			ArbolBinario<T> espejoHD=a.espejo(a.getHijoDerecho());
			ArbolBinario<T> arbol=new ArbolBinario<T>(a.getDatoRaiz());
			arbol.agregarHijoIzquierdo(espejoHD);
			arbol.agregarHijoDerecho(espejoHI);
			return arbol;
		}
	}
	public void entreNiveles(int nivelMinimo, int nivelMaximo, ArbolBinario<T> a) {
		if(a.getRaiz()==null) {
			return;	
		}
		ColaGenerica<NodoBinario<T>> cola=new ColaGenerica<NodoBinario<T>>();
		cola.encolar(a.getRaiz());
		NodoBinario<T> actual=null;
		int nivel=0;
		while(cola.esVacia()==false) {
			nivel++;
			int tamanio=cola.getTamanio();
			while(tamanio!=0) {
				actual=cola.tope();
				cola.desencolar();
				if((nivel>=nivelMinimo)&&(nivel<=nivelMaximo)){
					System.out.print(actual.getDato()+" ");
				}
				if(actual.getHijoIzquierdo()!=null) {
					cola.encolar(actual.getHijoIzquierdo());
				}
				if(actual.getHijoDerecho()!=null) {
					cola.encolar(actual.getHijoDerecho());
				}
				tamanio--;
			}
			if((nivel>=nivelMinimo)&&(nivel<=nivelMaximo)) {
				System.out.println("");
			}
		}
	}

}