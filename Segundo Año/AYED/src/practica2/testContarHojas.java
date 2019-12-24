package practica2;
import arbolBinario.ArbolBinario;
import ListasGenericasv2.ListaEnlazadaGenerica;
import practica2.ContadorArbol;
import java.util.Scanner;
public class testContarHojas {

	public static void main(String[] args) {
		Scanner in=new Scanner(System.in);
		ArbolBinario<Integer> arbolBinarioA = new ArbolBinario<Integer>(1);
		ArbolBinario<Integer> hijoIzquierdo=new ArbolBinario<Integer>(2);
		hijoIzquierdo.agregarHijoIzquierdo(new ArbolBinario<Integer>(3));
		hijoIzquierdo.agregarHijoDerecho(new ArbolBinario<Integer>(4));
		ArbolBinario<Integer> hijoDerecho=new ArbolBinario<Integer>(5);
		hijoDerecho.agregarHijoIzquierdo(new ArbolBinario<Integer>(6));
		hijoDerecho.agregarHijoDerecho(new ArbolBinario<Integer>(7));
		arbolBinarioA.agregarHijoIzquierdo(hijoIzquierdo);
		arbolBinarioA.agregarHijoDerecho(hijoDerecho);
		ArbolBinario<Integer>ArbolBinarioB=arbolBinarioA.espejo(arbolBinarioA);
		System.out.println(ArbolBinarioB.getDatoRaiz());
		System.out.println(ArbolBinarioB.getHijoIzquierdo().getDatoRaiz());
		System.out.println(ArbolBinarioB.getHijoDerecho().getDatoRaiz());
		System.out.println(ArbolBinarioB.getHijoIzquierdo().getHijoIzquierdo().getDatoRaiz());
		System.out.println(ArbolBinarioB.getHijoIzquierdo().getHijoDerecho().getDatoRaiz());
		System.out.println(ArbolBinarioB.getHijoDerecho().getHijoDerecho().getDatoRaiz());
		System.out.println(ArbolBinarioB.getHijoDerecho().getHijoIzquierdo().getDatoRaiz());
		//int cantHojas=arbolBinarioA.contarHojas(arbolBinarioA);
		//System.out.println(cantHojas);
		ContadorArbol arbol= new ContadorArbol(ArbolBinarioB);
		ListaEnlazadaGenerica<Integer> lista= arbol.numerosParesEnOrden(arbolBinarioA);
		lista.comenzar();
		while(!lista.fin()) {
			System.out.println(lista.proximo());
		}
		in.close();
	}

}
