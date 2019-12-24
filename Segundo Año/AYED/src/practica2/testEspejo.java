package practica2;

import arbolBinario.ArbolBinario;

public class testEspejo {

	public static void main(String[] args) {
		ArbolBinario<Integer> R = new ArbolBinario<Integer>(1);
		ArbolBinario<Integer> i1 = new ArbolBinario<Integer>(2);
		ArbolBinario<Integer> d1 = new ArbolBinario<Integer>(3);
		ArbolBinario<Integer> ii2 = new ArbolBinario<Integer>(4);
		ArbolBinario<Integer> id2 = new ArbolBinario<Integer>(5);
		ArbolBinario<Integer> di2 = new ArbolBinario<Integer>(6);
		d1.agregarHijoIzquierdo(di2);
		i1.agregarHijoDerecho(id2);
		i1.agregarHijoIzquierdo(ii2);
		R.agregarHijoDerecho(d1);
		R.agregarHijoIzquierdo(i1);
		ArbolBinario<Integer> a = R.espejo(R);
		System.out.println(a.getDatoRaiz());
		System.out.println(a.getHijoIzquierdo());
		System.out.println(a.getHijoDerecho());
		//a.recorridoPorNiveles(0,2);

	}

}
