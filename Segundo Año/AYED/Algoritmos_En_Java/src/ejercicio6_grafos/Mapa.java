package ejercicio6_grafos;
import grafos.*;
import ListasGenericasv2.*;
public class Mapa {
	private Grafo<String> mapaCiudades;
	private ListaGenerica<String> camino;
	private boolean freno;
	
	public Mapa(Grafo<String> mapaCiudades) {
		this.mapaCiudades=mapaCiudades;
	}
	
	public ListaGenerica<String> devolverCamino(String ciudad1,String ciudad2){
		ListaEnlazadaGenerica<String>lista=new ListaEnlazadaGenerica<String>();
		int i = 1;
		this.camino = null;
		boolean encontre = false;
		this.freno = false;
		while((i<=mapaCiudades.listaDeVertices().tamanio())&& (!encontre)){
			if (mapaCiudades.listaDeVertices().elemento(i).dato()== ciudad1){
				encontre = true;
				this.devolverCamino(mapaCiudades.listaDeVertices().elemento(i),ciudad2, lista);
			}
			i++;
		}
		return camino;
	}
	
	private void devolverCamino(Vertice<String> verticeInicial,String ciudadDestino,ListaEnlazadaGenerica<String> lista) {
		lista.agregarFinal(verticeInicial.dato());
		if(verticeInicial.dato()==ciudadDestino) {
			this.camino=lista.clonar();
			this.freno=true;
		}
		else {
			ListaGenerica<Arista<String>> adyacentes= mapaCiudades.listaDeAdyacentes(verticeInicial);
			adyacentes.comenzar();
			while(!adyacentes.fin()&& !freno) {
				Vertice<String> verticeAdy = adyacentes.proximo().verticeDestino();
				this.devolverCamino(verticeAdy, ciudadDestino, lista);
			}
		}
	}
	
	public ListaGenerica<String> devolverCaminoExceptuando(String ciudad1,String ciudad2,ListaGenerica<String> listaCiudades){
		ListaEnlazadaGenerica<String>lista=new ListaEnlazadaGenerica<String>();
		int i = 1;
		this.camino = null;
		boolean encontre = false;
		this.freno = false;
		while((i<=mapaCiudades.listaDeVertices().tamanio())&& (!encontre)){
			if (mapaCiudades.listaDeVertices().elemento(i).dato()== ciudad1){
				encontre = true;
				this.devolverCaminoExceptuando(mapaCiudades.listaDeVertices().elemento(i),ciudad2, lista,listaCiudades);
			}
			i++;
		}
		return camino;
	}
	
	private void devolverCaminoExceptuando(Vertice<String> verticeInicial,String ciudadDestino,ListaEnlazadaGenerica<String> lista,ListaGenerica<String> listaCiudades) {
		lista.agregarFinal(verticeInicial.dato());
		if(verticeInicial.dato()==ciudadDestino) {
			this.camino=lista.clonar();
			this.freno=true;
		}
		else {
			ListaGenerica<Arista<String>> adyacentes= mapaCiudades.listaDeAdyacentes(verticeInicial);
			adyacentes.comenzar();
			while(!adyacentes.fin()&& !freno) {
				Vertice<String> verticeAdy = adyacentes.proximo().verticeDestino();
				if(!listaCiudades.incluye(verticeAdy.dato())) {
					this.devolverCaminoExceptuando(verticeAdy, ciudadDestino, lista,listaCiudades);
				}
			}
		}
	}
	
	public ListaGenerica<String> caminoMasCorto(String ciudad1,String ciudad2){
		
		return camino;
	}
}