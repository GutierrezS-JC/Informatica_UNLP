Program EjercitacionDos;
const
  infe=1500;
  supe=2200;
  Fechatipo='12/7/2018';
type
  cadena=String[50];
  ventas=record
    fecha:cadena;
    cod:integer;
    tipo:cadena;
    cantidad:integer;
    monto:integer;
  end;


  venta=record
    cod:integer;
    tipo:cadena;
    monto:integer;
  end;

  arbol=^nodoA;
  nodoA=record
    info:venta;
    hi:arbol;
    hd:arbol;
  end;


Procedure LeerRegistro(var r:ventas);
begin
 // write('Ingrese la cantidad: ');
  r.cantidad:=random(20);
  r.cantidad:=r.cantidad-1;
  if(r.cantidad<>-1) then begin
   // write('Ingrese la fecha: ');
    r.fecha:=fechaTipo;
   // write('Ingrese el codigo: ');
    r.cod:=random(3000);
   // write('Ingrese el monto: ');
    r.monto:=random(200);

   // write('Ingrese el tipo: ');
    r.tipo:=('asda');
  end;
end;






procedure insertarArbol(var a:arbol;dato:venta);
begin

if (a=nil) then begin
  new(a);
  a^.info:=dato;
  a^.HI:=nil;
  a^.HD:=nil;
end
else
  if (dato.cod<a^.info.cod)then
     insertarArbol(a^.HI,dato)
  else
    if(dato.cod>a^.info.cod)then
     insertarArbol(a^.HD,dato)


end;

Procedure CargarArbol(var a:arbol);
var
r:ventas;
reg:venta;
begin
  leerregistro(r);
  while(r.cantidad<>-1) do begin
    reg.cod:=r.cod;
    reg.tipo:=r.tipo;
    reg.monto:=r.monto;
    Insertararbol(a,reg);
    leerregistro(r);
  end;
end;


Procedure VerValoresEnRango(a:arbol;inf,sup:integer);
begin
  if(a<>nil) then begin
    if(a^.info.cod >= inf) then
      if(a^.info.cod<=sup) then begin
        VerValoresEnRango(a^.hi,inf,sup);
        writeln(a^.info.tipo,' ');
        VerValoresEnRango(a^.hd,inf,sup);
      end else
        VerValoresEnRango(a^.hi,inf,sup)
      else
        VerValoresenrango(a^.hd,inf,sup);
  end;
end;



{Procedure enOrden( a: arbol);
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    write('!',a^.info.cod);
    enOrden (a^.HD);
 end;
end; }

 procedure puntoA(a:arbol; var cant:integer);
  begin
       if(a <> nil) then begin
          puntoA(a^.hi,cant);
          if(a^.info.monto >100)then
           cant:=cant+1;
          puntoA(a^.hd,cant);
       end;

 end;

var
  a:arbol;
  n:integer;
begin
  n:=0;
  a:=nil;
  CargarArbol(a);
  VerValoresEnRango(a,infe,supe);
  puntoA(a,n);
  write('La cantidad de ventas cuyo monto total supero a 100 pesos: ');
  writeln(n);
  {writeln;writeln;enOrden(a)};
  readln;
end.


