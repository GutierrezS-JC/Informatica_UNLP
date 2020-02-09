package recorridosGrafos;

import grafos.*;
import ListasGenericasv2.*;
public class PruebaRecorridos {

	public static void main(String[] args) {
		Vertice<Integer> v1 = new VerticeImplListAdy<Integer>(1);
		Vertice<Integer> v2 = new VerticeImplListAdy<Integer>(2);
		Vertice<Integer> v3 = new VerticeImplListAdy<Integer>(3);
		Grafo<Integer> numeros = new GrafoImplListAdy<Integer>();
		numeros.agregarVertice(v1);
		numeros.agregarVertice(v2);
		numeros.agregarVertice(v3);
		numeros.conectar(v1, v2);
		numeros.conectar(v1, v3);
		numeros.conectar(v2, v3);
		Recorridos<Integer> r = new Recorridos<Integer> ();
		ListaEnlazadaGenerica<Vertice<Integer>>lis = r.dfs(numeros);
		lis.comenzar();
		while (!lis.fin()) {
			System.out.println(lis.proximo().dato());
		}

	}

}
