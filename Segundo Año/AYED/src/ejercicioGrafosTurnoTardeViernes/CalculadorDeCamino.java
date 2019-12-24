package ejercicioGrafosTurnoTardeViernes;
import ListasGenericasv2.*;
import grafos.*;
public class CalculadorDeCamino {
	private ListaEnlazadaGenerica<String> camino;
	private boolean freno;
	private int cant=0;
	
	public ListaEnlazadaGenerica<String> buscarCamino(Grafo<String> mapa, int cantidadDeCiudades){
		boolean []marca =new boolean[mapa.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<String> lista=new ListaEnlazadaGenerica<String>();
		int i=1;
		String ciudadOrigen="Cadiz";
		String ciudadDestino="Oviedo";
		Vertice<String>verticeOrigen=null;
		Vertice<String>verticeDestino=null;
		int posOrigen=1;
		while(i<=mapa.listaDeVertices().tamanio()) {
			if(mapa.listaDeVertices().elemento(i).dato()==ciudadOrigen) {
				verticeOrigen=mapa.listaDeVertices().elemento(i);
				posOrigen=i;
			}
			if(mapa.listaDeVertices().elemento(i).dato()==ciudadDestino) {
				verticeDestino=mapa.listaDeVertices().elemento(i);
			}
			i++;
		}
		if(verticeOrigen!=null && verticeDestino!=null) {
			if(!marca[posOrigen]) {
				this.buscarCamino(marca,posOrigen,verticeOrigen,verticeDestino,ciudadDestino,mapa, cantidadDeCiudades,lista);
			}
		}
		return camino;
	}
	
	private void buscarCamino(boolean[] marca,int posOrigen,Vertice<String>vOrigen,Vertice<String> vDestino,String ciudadDestino, Grafo<String>mapa,int cantidadDeCiudades,ListaEnlazadaGenerica<String>lista) {
		marca[posOrigen]=true;
		lista.agregarFinal(vOrigen.dato());
		cant++;
		if(vOrigen.dato()==vDestino.dato()) {
			camino=(ListaEnlazadaGenerica<String>) lista.clonar();
			freno=true;
		}
		else {
			ListaGenerica<Arista<String>> adyacentes=mapa.listaDeAdyacentes(vOrigen);
			adyacentes.comenzar();
			while(!adyacentes.fin() && !freno) {
				Arista<String> prox=adyacentes.proximo();
				Vertice<String>vAux=prox.verticeDestino();
				int proxPos=vAux.getPosicion();
				if(!marca[proxPos]&& cant<=cantidadDeCiudades) {
					this.buscarCamino(marca, proxPos, vAux, vDestino, ciudadDestino, mapa, cantidadDeCiudades, lista);
				}
			}
		}
		lista.eliminarEn(lista.tamanio());
	}
	
}
