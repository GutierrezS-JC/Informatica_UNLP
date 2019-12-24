package genericos;

import ListasGenericasv2.ListaEnlazadaGenerica;

public class ColaGenerica<T> {
	private ListaEnlazadaGenerica<T> datos;
	
	
	public ColaGenerica() {
		this.datos = new ListaEnlazadaGenerica<T>();
	}
	public void encolar(T elem) {
		datos.agregarInicio(elem);
	}
	public T desencolar() {
		T d = datos.elemento(datos.tamanio());
		datos.eliminarEn(datos.tamanio());
		return d;
	}
	public T tope () {
		return datos.elemento(datos.tamanio());
	}
	public boolean esVacia() {
		return datos.esVacia();
	}
	public int getTamanio() {
		return datos.tamanio();
	}

}
