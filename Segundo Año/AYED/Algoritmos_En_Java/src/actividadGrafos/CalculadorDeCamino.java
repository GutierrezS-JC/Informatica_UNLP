package actividadGrafos;
import grafos.*;
import ListasGenericasv2.*;
public class CalculadorDeCamino {
	
	private Grafo<String> grafo;
	private ListaGenerica<String> camino;
	private boolean freno;
	
	
	public ListaGenerica<String> devolverCaminoExceptuando(ListaGenerica<String> listaCiudades){
		ListaEnlazadaGenerica<String>lista=new ListaEnlazadaGenerica<String>();
		String ciudad1="Cadiz";
		String ciudad2="Oviedo";
		int i = 1;
		this.camino = null;
		boolean encontre = false;
		this.freno = false;
		while((i<=grafo.listaDeVertices().tamanio())&& (!encontre)){
			if (grafo.listaDeVertices().elemento(i).dato() == ciudad1){
				encontre = true;
				this.devolverCaminoExceptuando(grafo.listaDeVertices().elemento(i),ciudad2, lista,listaCiudades);
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
			ListaGenerica<Arista<String>> adyacentes= grafo.listaDeAdyacentes(verticeInicial);
			adyacentes.comenzar();
			while(!adyacentes.fin()&& !freno) {
				Vertice<String> verticeAdy = adyacentes.proximo().verticeDestino();
				if(!listaCiudades.incluye(verticeAdy.dato())) {
					this.devolverCaminoExceptuando(verticeAdy, ciudadDestino, lista,listaCiudades);
				}
			}
		}
		lista.eliminarEn(lista.tamanio());
	}

}
