{Un supermercado dispone en papel de la informacion de las ventas de sus productos .
 De cada venta se conoce fecha, codigo de producto , tipo de producto, cantidad vendida, monto total de la venta.

 Se pide realizar un programa que:

  a) Genere un ABB ordenado por codigo de producto, con las ventas de dicho producto a partir de la informacion que se ingresa por teclado.
     El ingreso finaliza cuando se lee la venta cuya cantidad vendida es -1.

  b) Luego de generada la estructura, informar (debe implementar un modulo para cada inciso):
     i-) El tipo de producto cuyo codigo esta comprendido entre los valores 1500 y 2200.
    ii-) La cantidad de ventas cuyo monto total resulto superior a 100 pesos}

Program EjercitacionDos;
type
  cadena=string[50];
  ventas=record
    fecha: cadena;
    codigo:integer;
    tipo: cadena;
    cantidad:integer;
    monto:integer;
  end;

  ventasA=record
    cod:integer;
    tipo: cadena;
    monto: integer;
  end;

  Arbol=^nodoA;
  nodoA=record
    info: ventasA;
    hi:arbol;
    hd: arbol;
  end;

Procedure Insertar(var a:arbol; r2:ventasA);       {Insertar sin Repetidos}
begin
  if(a=nil) then begin
    new(a);
    a^.info:=r2;
    a^.hi:=nil;
    a^.hd:=nil;
  end
  else
    if(r2.cod<a^.info.cod) then
      Insertar(a^.hi,r2)
    else
      if(r2.cod>a^.info.cod) then
        Insertar(a^.hd,r2);
end;

Procedure LeerRegistro(var r:ventas);
begin
  write('Ingrese cantidad vendida: ');
  readln(r.cantidad);
  if(r.cantidad<>-1) then begin
    write('Ingrese fecha: ');
    readln(r.fecha);
    write('Ingrese codigo: ');
    readln(r.codigo);
    write('Ingrese tipo de producto: ');
    readln(r.tipo);
    write('Ingrese Monto total de venta: ');
    readln(r.monto);
  end;
end;


Procedure CargarArbol(var a:arbol);
var
  r:ventas;
  r2:ventasA;
begin
  LeerRegistro(r);
  while(r.cantidad<>-1) do begin
    r2.cod:=r.codigo;
    r2.tipo:=r.tipo;
    r2.monto:=r.monto;
    Insertar(a,r2);
    LeerRegistro(r);
  end;
end;

Procedure RecorridoAcotado(a:arbol);    {Punto B1}
begin
  if(a<>nil) then begin
    if(a^.info.cod>=1500) then begin                {Valores sup e inf con valor explicito}
      if(a^.info.cod<=2200) then begin
        write('Tipo: ', a^.info.tipo, ' ');
        RecorridoAcotado(a^.hi);
        RecorridoAcotado(a^.hd)
      end else
        RecorridoAcotado(a^.hi)
    end else
      RecorridoAcotado(a^.hd);
  end;
end;

Procedure enOrden(a:arbol; var cant:integer);          {Punto b2}
begin
  if(a<>nil) then begin
    enOrden(a^.hi,cant);
    if(a^.info.monto>100) then
      cant:=cant+1;
    enOrden(a^.hd,cant);
  end;
end;

var
  a:arbol;
  cant:integer;
begin
  a:=nil;
  CargarArbol(a);
  write('Los tipos de productos cuyos codigos estan comprendidos entre los valores 1500 y 2200 son: ');
  RecorridoAcotado(a);
  writeln;
  cant:=0;
  enOrden(a,cant);
  write('La cantidad de ventas cuyo monto total resulto superior a 100 pesos es: ');
  writeln(cant);
  readln;
end.
