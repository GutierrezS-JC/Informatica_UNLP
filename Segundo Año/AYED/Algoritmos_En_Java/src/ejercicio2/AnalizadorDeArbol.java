package ejercicio2;
import ListasGenericasv2.*;
import arbolGeneral.*;
public class AnalizadorDeArbol {
	private ListaEnlazadaGenerica<Integer> listaDos;
	
	private void calcular(ArbolGeneral<Integer> arbol, Integer min, Integer max) {
		if(!arbol.esVacio()) {
			if(arbol.getDatoRaiz()>=min && arbol.getDatoRaiz()<=max) {
				listaDos.agregarFinal(arbol.getDatoRaiz());
			}
			ListaGenerica<ArbolGeneral<Integer>>listaHijos=arbol.getHijos();
			listaHijos.comenzar();
			while(!listaHijos.fin()) {
				calcular(listaHijos.proximo(),min,max);
			}
		}
		
	}
	
	public ListaEnlazadaGenerica<Integer> elementosEnRango(ArbolGeneral<Integer> arbol,Integer min, Integer max){
		listaDos=new ListaEnlazadaGenerica<Integer>();
		calcular(arbol,min,max);
		return listaDos;
	}
}
