package genericos;

import ListasGenericasv2.ListaEnlazadaGenerica;

public class PilaGenerica<T> {
	private ListaEnlazadaGenerica<T> datos;
	
	
	public PilaGenerica() {
		this.datos = new ListaEnlazadaGenerica<T>();
	}
	public void apilar (T elem) {
		datos.agregarInicio(elem);
	}
	public T desapilar() {
		T d = datos.elemento(1);
		datos.eliminarEn(1);
		return d;
	}
	public T tope() {
		return datos.elemento(1);
	}
	public boolean esVacia() {
		return datos.esVacia();
	}
}
