package ejercicio6_grafos;
import grafos.*;
import ListasGenericasv2.*;
public class Prueba {

	public static void main(String[] args) {
				Vertice<String> v1 = new VerticeImplListAdy<String>("La Plata");
				Vertice<String> v2 = new VerticeImplListAdy<String>("Jujuy");
				Vertice<String> v3 = new VerticeImplListAdy<String>("Cordoba");
				Vertice<String> v4 = new VerticeImplListAdy<String>("San Luis");
				Vertice<String> v5 = new VerticeImplListAdy<String>("Misiones");
				Vertice<String> v6 = new VerticeImplListAdy<String>("Neuquen");
				Vertice<String> v7 = new VerticeImplListAdy<String>("Olavarria");
				Grafo<String> mapa = new GrafoImplListAdy <String>();
				mapa.agregarVertice(v1);
				mapa.agregarVertice(v2);
				mapa.agregarVertice(v3);
				mapa.agregarVertice(v4);
				mapa.agregarVertice(v5);
				mapa.agregarVertice(v6);
				mapa.agregarVertice(v7);
				mapa.conectar(v1, v2);
				mapa.conectar(v1, v3);
				mapa.conectar(v1, v6);
				mapa.conectar(v2, v4);
				mapa.conectar(v3, v5);
				mapa.conectar(v3, v6);
				mapa.conectar(v4, v7);
				mapa.conectar(v6, v5);
				mapa.conectar(v5, v7);
				Mapa m = new Mapa(mapa);
				ListaGenerica<String> camino1 = m.devolverCamino("La Plata", "Neuquen");
				if(camino1 != null) {
					camino1.comenzar();
					while(!camino1.fin()) {
						System.out.println(camino1.proximo());
					}
				}
				else {
					System.out.println("El camino no existe");
				}
				System.out.println("--------------------------------------------");
				ListaEnlazadaGenerica<String> evitar = new ListaEnlazadaGenerica <String>();
				evitar.agregarFinal("Jujuy");
				evitar.agregarFinal("Olavarria");
				ListaGenerica<String> camino2 = m.devolverCaminoExceptuando("La Plata", "Neuquen", evitar);
				if(camino2 != null) {
					camino2.comenzar();
					while(!camino2.fin()) {
						System.out.println(camino2.proximo());
					}
				}
				else {
					System.out.println("El camino no existe");
				}

	}

}
