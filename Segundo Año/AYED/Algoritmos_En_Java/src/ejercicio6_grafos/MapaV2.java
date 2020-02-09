package ejercicio6_grafos;
import grafos.*;
import ListasGenericasv2.*;

public class MapaV2 {
	Grafo<String> grafo;
	ListaGenerica<String> camino;
	boolean freno;
	//int distanciaDeRuta;
	private int cargas=Integer.MAX_VALUE;
	private int min = Integer.MAX_VALUE;
	
	public MapaV2(Grafo<String> grafo) {
		this.grafo=grafo;
	}
	
	public ListaGenerica<String> devolverCamino(String ciudad1,String ciudad2) {
		boolean marca[]=new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<String> lista= new ListaEnlazadaGenerica<String>();
		int i=1;
		freno=false;
		camino=null;
		boolean encontre=false;
		while(i<=grafo.listaDeVertices().tamanio()&& !encontre) {
			if(grafo.listaDeVertices().elemento(i).dato()==ciudad1) {
				encontre=true;
				if(!marca[i]) {
					this.devolverCamino(lista,ciudad2,grafo.listaDeVertices().elemento(i),marca,i);
				}
			}
			i++;
		}
		return camino;
	}
	private void devolverCamino(ListaEnlazadaGenerica<String> lista,String ciudad2, Vertice<String> verticeInicial,boolean[] marca,int i) {
		marca[i]=true;
		//Arista<String>arista=null;
		lista.agregarFinal(verticeInicial.dato());
		if(verticeInicial.dato()==ciudad2) {
			camino=lista.clonar();
			freno=true;
		}
		else {
			ListaGenerica<Arista<String>> adyacentes=grafo.listaDeAdyacentes(verticeInicial);
			adyacentes.comenzar();
			while(!adyacentes.fin() && !freno) {
				Vertice<String> vertice = adyacentes.proximo().verticeDestino();
				int j = vertice.getPosicion();
				//arista=adyacentes.proximo();
				//int j=arista.verticeDestino().getPosicion();
				if(!marca[j]) {
					devolverCamino(lista, ciudad2,vertice,marca,j);
				}
			}
		}
		lista.eliminarEn(lista.tamanio());
		marca[i]=false;
	}
	
	public ListaGenerica<String> devolverCaminoExceptuando(String ciudad1,String ciudad2,ListaGenerica<String> listaExceptuando) {
		boolean marca[]= new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<String> lista=new ListaEnlazadaGenerica<String>();
		int i=1;
		boolean encontre=false;
		freno=false;
		while(i<=grafo.listaDeVertices().tamanio() && !encontre) {
			if(grafo.listaDeVertices().elemento(i).dato()==ciudad1) {
				encontre=true;
				if(!marca[i]) {
					this.devolverCaminoExceptuando(grafo.listaDeVertices().elemento(i),marca,i,ciudad2,lista,listaExceptuando);
				}
			}
			i++;
		}
		return camino;
	}
	
	private void devolverCaminoExceptuando(Vertice<String> verticeInicial,boolean []marca,int i,String ciudadDestino,ListaEnlazadaGenerica<String>lista, ListaGenerica<String>listaExceptuando) {
		marca[i]=true;
		lista.agregarFinal(verticeInicial.dato());
		if(verticeInicial.dato()==ciudadDestino) {
			camino=lista.clonar();
			freno=true;
		}
		else {
			ListaGenerica<Arista<String>>adyacentes=grafo.listaDeAdyacentes(verticeInicial);
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				Vertice<String> vertice=adyacentes.proximo().verticeDestino();
				int j=vertice.getPosicion();
				if(!marca[j] && !listaExceptuando.incluye(vertice.dato())) {
					this.devolverCaminoExceptuando(vertice, marca, j, ciudadDestino, lista, listaExceptuando);
				}
			}
		}
		lista.eliminarEn(lista.tamanio());
		marca[i]=false;
	}
	
	public ListaGenerica<String> caminoMasCorto(String ciudad1, String ciudad2){
		boolean marca[]=new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<String> lista=new ListaEnlazadaGenerica<String>();
		int i=1;
		boolean encontre=false;
		//
		int recorrido=0;
		while(i<=grafo.listaDeVertices().tamanio() && !encontre) {
			if(grafo.listaDeVertices().elemento(i).dato()==ciudad1) {
				encontre=true;
				if(!marca[i]) {
					this.caminoMasCorto(i,recorrido,ciudad2,marca,grafo.listaDeVertices().elemento(i), lista);
				}
			}
			i++;
		}
		return camino;
	}
	
	private void caminoMasCorto(int i, int recorrido, String ciudadDestino, boolean[]marca,Vertice<String> verticeInicial,ListaEnlazadaGenerica<String> lista) {
		 marca[i]=true;
		 lista.agregarFinal(verticeInicial.dato());
		 if(verticeInicial.dato()==ciudadDestino) {
			 if (recorrido < min) {
				 min = recorrido;
				 camino=lista.clonar();
			 }
		 }
		 else {
			 ListaGenerica<Arista<String>>adyacentes=grafo.listaDeAdyacentes(verticeInicial);
			 adyacentes.comenzar();
			 while(!adyacentes.fin()) {
				 Vertice<String> vertice=adyacentes.proximo().verticeDestino();
				 int j=vertice.getPosicion();
				 if(!marca[j] && recorrido+adyacentes.proximo().peso() < min) {
					 this.caminoMasCorto(j, recorrido+adyacentes.proximo().peso(), ciudadDestino, marca, verticeInicial, lista);
				 }
			 }
		 }
		 marca[i]=false;
		 lista.eliminarEn(lista.tamanio());
	}

	public ListaGenerica<String> caminoSinCargarCombustible(String ciudad1,String ciudad2,int tanqueAuto){
		boolean [] marca= new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<String>lista=new ListaEnlazadaGenerica<String>();
		camino=null;
		freno=false;
		Vertice<String>vInicio=null;
		Vertice<String>vFinal=null;
		int i=1;
		while(i<=grafo.listaDeVertices().tamanio()) {
			if(grafo.listaDeVertices().elemento(i).dato()==ciudad1) {
				vInicio=grafo.listaDeVertices().elemento(i);
			}
			if(grafo.listaDeVertices().elemento(i).dato()==ciudad2) {
				vFinal=grafo.listaDeVertices().elemento(i);
			}
		i++;
		}
		if(vInicio!=null && vFinal!=null) {
			//if(!marca[i]) {
				this.caminoSinCargarCombustible(i,marca,vInicio, vFinal, tanqueAuto, lista);
			//}
		}
		return camino;
	}
	
	private void caminoSinCargarCombustible(int i, boolean [] marca, Vertice<String>vInicio,Vertice<String>vFinal,int tanqueAuto,ListaEnlazadaGenerica<String> lista) {
		marca[i]=true;
		lista.agregarFinal(vInicio.dato());
		if(vInicio==vFinal) {
			camino=lista.clonar();
			freno=true;
		}
		else {
			ListaGenerica<Arista<String>> adyacentes=grafo.listaDeAdyacentes(vInicio);
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				 Arista<String> prox=adyacentes.proximo(); 					//si uso varias veces proximo salteo el elemento
				 Vertice<String> vAux=prox.verticeDestino();
				 int j=vAux.getPosicion();
				 if(!marca[j] && tanqueAuto>=adyacentes.proximo().peso()) {
					 this.caminoSinCargarCombustible(j,marca,vAux,vFinal,tanqueAuto-prox.peso(),lista);
				 }
			 }
		 }
		marca[i]=false;
		lista.eliminarEn(lista.tamanio());
	}
	
	public ListaGenerica<String> caminoConMenorCargaDeCombustible(String ciudad1,String ciudad2, int tanqueAuto){
		boolean[] marca= new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<String>lista=new ListaEnlazadaGenerica<String>();
		Vertice <String> vInicio=null;
		Vertice <String> vFinal= null;
		camino=null;
		int i=1;
		while(i<=grafo.listaDeVertices().tamanio()) {
			if(grafo.listaDeVertices().elemento(i).dato()==ciudad1) {
				vInicio=grafo.listaDeVertices().elemento(i);
			}
			if(grafo.listaDeVertices().elemento(i).dato()==ciudad2) {
				vFinal=grafo.listaDeVertices().elemento(i);
			}
		i++;
		}
		if((vInicio!=null)&&(vFinal!=null)){
			this.caminoConMenorCargaDeCombustible(i,marca,vInicio, vFinal, lista, tanqueAuto,0,tanqueAuto);
		}
		return camino;
	}
	
	private void caminoConMenorCargaDeCombustible(int i,boolean[]marca, Vertice<String>vInicio,Vertice<String>vFinal,ListaEnlazadaGenerica<String>lista, int tanqueAuto, int cantCargas, int tanqueLleno) {
		marca[i]=true;
		lista.agregarFinal(vInicio.dato());
		if(vInicio.dato() == vFinal.dato()){
			cargas=cantCargas;
			this.camino = lista.clonar();
		}
		else {
			ListaGenerica<Arista<String>> adyacentes = grafo.listaDeAdyacentes(vInicio);
			adyacentes.comenzar();
			while(!adyacentes.fin()){
				Arista<String> prox=adyacentes.proximo();
	            Vertice<String> vAux=prox.verticeDestino();
	            int pos=vAux.getPosicion();
	            if(tanqueAuto-prox.peso()>=0) {
	            	tanqueAuto=tanqueLleno;
	            	//cantCargas++;
	            }
	            if(!marca[pos] && cantCargas<cargas && (tanqueAuto>prox.peso())) {
	            	caminoConMenorCargaDeCombustible(i,marca,vAux,vFinal,lista,tanqueAuto-prox.peso(),cantCargas+1,tanqueLleno);
	            }
			}
		}
		lista.eliminarEn(lista.tamanio());
		marca[i]=false;
	}
	
}
