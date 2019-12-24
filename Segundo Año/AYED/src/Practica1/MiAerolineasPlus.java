package Practica1;
import ListasGenericasv2.ListaEnlazadaGenerica;

public class MiAerolineasPlus {
	
	public void acreditarMillas(ListaEnlazadaGenerica<Socio> L1, ListaEnlazadaGenerica <Millaje> L2,
								ListaEnlazadaGenerica<Pasajero> L3) {
		L3.comenzar();
		L1.comenzar();
		L2.comenzar();
		while(!L3.fin()) {
			Pasajero P= new Pasajero(); //Pasajero P= L3.proximo();
			P=L3.proximo();
			Socio S=L1.proximo();
			while(!L1.fin()&& P.getNroSocio()!= S.getNroSocio()) {
				S=L1.proximo();
			}
			L1.comenzar();
			if((P.getNroSocio()== S.getNroSocio())) {
				Millaje millas=new Millaje(); //Millaje millas= L2.proximo();
				while(P.getDestino()!=millas.getDestino()&&(millas.getCategoria()!=P.getCategoria())) {
					millas=L2.proximo();
				}
				L2.comenzar();
				S.setMillas(millas.getMillasAcreditar()+S.getMillas());
			}
		}
	}
}
