
package parcialfranco;

import java.util.Scanner;


public class ParcialFranco {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        
        String [] destinos = new String[10];
        
        int i; String d;
        String marca , modelo , matricula;  double montoxKms; int nroLicencia; String LH; double montoMin;
        
        int cantAsientos;
        /*************************** CARGA DE VIAJES EN EL VECTOR ******************************************/
        
        for(i=0; i<10 ;i++){
            System.out.println("viaje nro : " + i + " Ingrese un destino para viajar"); 
            d=in.nextLine();
            destinos[i]=d;
        }
        /***************************LECTURA DE DATOS REMISSE******************************************/
        System.out.println("Comienza la carga de los datos del remisse");
        
        System.out.println("Ingrese una marca para el remisse");
        marca=in.nextLine();
        
        System.out.println("Ingrese un modelo para el remisse");
        modelo=in.nextLine();
        
        System.out.println("Ingrese una matricula para el remisse");
        matricula=in.nextLine();
        
        System.out.println("Ingrese monto por kms para el remisse");
        montoxKms=in.nextDouble();
        
        System.out.println("Ingrese un nro de licencia para el remisse");
        nroLicencia=in.nextInt();
        
        in.nextLine();
        
        System.out.println("Ingrese una localidad habilitacion para el remisse");
        LH=in.nextLine();
        
        System.out.println("Ingrese un monto minimo de viaje para el remisse");
        montoMin=in.nextDouble();
        
        in.nextLine();
        
        /***************************LOS INSERTO EN EL REMISSE******************************************/
        
        Remisse r = new Remisse(marca , modelo , matricula ,montoxKms , nroLicencia , LH, montoMin);
        
       /***************************CARGA DE DATOS COMBI ******************************************/
        System.out.println("Comienza la carga de los datos de la combi");
       
       System.out.println("Ingrese una marca para la combi");
        marca=in.nextLine();
        
        System.out.println("Ingrese un modelo para la combi");
        modelo=in.nextLine();
        
        System.out.println("Ingrese una matricula para la combi");
        matricula=in.nextLine();
        
        System.out.println("Ingrese monto por kms para la combi");
        montoxKms=in.nextDouble();
        
        in.nextLine();
        
        System.out.println("Ingrese la cantidad de asientos para la combi");
        cantAsientos=in.nextInt();
        
        in.nextLine();
        
        /***************************LOS INSERTO EN LA COMBI******************************************/
        
        Combi c = new Combi(destinos , cantAsientos , marca , modelo , matricula , montoxKms);
        
       
        System.out.println("Carca finalizada , acontinuacion probaremos los metodos");
        
        /***************************PRUEBA DE METODOS******************************************/
                
        System.out.println("Metodo calcular monto de viaje de la combi : " + c.calcularMontoViaje(50)); // Le mando 50 kms
       
        
        System.out.println("Metodo calcular monto de viaje del remisse  : " + r.calcularMontoViaje(60)); // Le mando 60 kms 
        
        
        System.out.println("Metodo  CONSULTAR SI LA COMBI HACE UNA VIAJE A UN LUGAR DETERMINADO");
        System.out.println("Ingrese un destino a buscar");
        
        d=in.nextLine();
        
        if(c.combiViajeDeterminado(d)==true)
             System.out.println("La combi si hace un viaje a " + d);
        else
            System.out.println("La combi no hace un viaje a " + d);
        
        System.out.println("fin");
        
    }
    
}
