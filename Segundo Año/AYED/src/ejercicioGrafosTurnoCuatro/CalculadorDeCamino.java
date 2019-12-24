package ejercicioGrafosTurnoCuatro;
import grafos.*;
import ListasGenericasv2.*;
public class CalculadorDeCamino {
	private ListaEnlazadaGenerica<String> camino;
	boolean encontre;
	
	public ListaEnlazadaGenerica<String> buscarCamino(Grafo<String> mapa,int costoArista){
		boolean []marca=new boolean[mapa.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<String> lista=new ListaEnlazadaGenerica<String>();
		int i=1;
		String ciudadOrigen="Cadiz";
		String ciudadDestino="Oviedo";
		Vertice<String>verticeOrigen=null;
		Vertice<String>verticeDestino=null;
		int posInicial=1;
		while(i<=mapa.listaDeVertices().tamanio()) {
			if(mapa.listaDeVertices().elemento(i).dato()==ciudadOrigen) {
				posInicial=i;
				verticeOrigen=mapa.listaDeVertices().elemento(i);
			}
			if(mapa.listaDeVertices().elemento(i).dato()==ciudadDestino) {
				verticeDestino=mapa.listaDeVertices().elemento(i);
			}
			i++;
		}
		if(verticeOrigen!=null && verticeDestino!=null) {
			this.buscarCamino(posInicial,verticeOrigen, verticeDestino,costoArista,marca,lista,mapa);
		}
		return camino;
	}
	
	private void buscarCamino(int posInicial,Vertice<String> verticeOrigen,Vertice<String> verticeDestino,int costoArista,boolean[] marca,ListaEnlazadaGenerica<String>lista,Grafo<String> mapa) {
		marca[posInicial]=true;
		lista.agregarFinal(verticeOrigen.dato());
		if(verticeOrigen.dato()==verticeDestino.dato()) {
			camino=(ListaEnlazadaGenerica<String>) lista.clonar(); //en realida camino deberia ser generico asi como el metodo principal
			encontre=true;
		}
		else {
			ListaGenerica<Arista<String>>adyacentes= mapa.listaDeAdyacentes(verticeOrigen);
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				Arista<String> prox=adyacentes.proximo(); 					//si uso varias veces proximo salteo el elemento
				Vertice<String> vAux=prox.verticeDestino();
				int proxPos=vAux.getPosicion();
				if(!marca[posInicial] && prox.peso()>costoArista) {
					this.buscarCamino(proxPos, vAux, verticeDestino, costoArista, marca, lista, mapa);
				}
			}
		}
		lista.eliminarEn(lista.tamanio());
	}
}
