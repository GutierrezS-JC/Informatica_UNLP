package recorridosGrafos;
import grafos.*;
import ListasGenericasv2.*;
public class Recorridos<T>{
	
	public ListaEnlazadaGenerica<Vertice<T>> dfs(Grafo<T> grafo) {
		ListaEnlazadaGenerica<Vertice<T>> lista = new ListaEnlazadaGenerica<Vertice<T>>();
		boolean [] marca= new boolean[grafo.listaDeVertices().tamanio()+1];
		for(int i=1;i<=grafo.listaDeVertices().tamanio();i++) {
			if(!marca[i]) {
				this.dfs(i,grafo,marca,lista);
			}
		}
		return lista;
	}
	private void dfs(int i,Grafo<T> grafo, boolean[] marca,ListaEnlazadaGenerica<Vertice<T>> lista) {
		marca[i]=true;
		Arista <T> arista=null;
		int j=0;
		Vertice<T> v=grafo.listaDeVertices().elemento(i);
		lista.agregarFinal(v);
		ListaGenerica<Arista<T>> ady= grafo.listaDeAdyacentes(v);
		ady.comenzar();
		while(!ady.fin()) {
			arista=ady.proximo();
			j=arista.verticeDestino().getPosicion();
			if(!marca[j]) {
				this.dfs(j,grafo,marca,lista);
			}
		}
	}
	
	public ListaEnlazadaGenerica<Vertice<T>> dfs2(Grafo<T> grafo){
		boolean [] marca=new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<Vertice<T>> lista=new ListaEnlazadaGenerica<Vertice<T>>();
		for(int i=1;i<=grafo.listaDeVertices().tamanio();i++) {
			if(!marca[i]) {
				this.dfs2(i,grafo,lista,marca);
			}
		}
		return lista;
	}
	
	private void dfs2(int i, Grafo<T> grafo, ListaEnlazadaGenerica<Vertice<T>> lista, boolean[] marca ) {
		marca[i]=true;
		Arista<T> arista=null;
		int j=0;
		Vertice<T> vertice=grafo.listaDeVertices().elemento(i);
		lista.agregarFinal(vertice);
		ListaGenerica<Arista<T>> adyacentes=grafo.listaDeAdyacentes(vertice);
		adyacentes.comenzar();
		while(!adyacentes.fin()) {
			arista=adyacentes.proximo();
			j=arista.verticeDestino().getPosicion();
			if(!marca[j]) {
				this.dfs2(j,grafo,lista,marca);
			}
		}
	}
	
	
}
