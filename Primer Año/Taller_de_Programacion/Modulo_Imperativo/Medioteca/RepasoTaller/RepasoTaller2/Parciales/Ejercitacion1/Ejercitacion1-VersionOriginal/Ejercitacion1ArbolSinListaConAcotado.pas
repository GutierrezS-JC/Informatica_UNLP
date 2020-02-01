{Un supermercado dispone en papel de la informacion de sus productos. De cada producto se conoce tipo, descripcion, codigo y precio. 
 Se pide realizar un programa que:

a) Genere un ABB ordenado por codigo, con informacion de los productos que se ingresan por teclado.
   El ingreso finaliza cuando se lee el producto con tipo igual a zzz.

b) Luego de generada la estructura, informar (debe implementar un modulo para cada inciso):
  i) El tipo y la descripcion de los productos cuyo codigo esta entre los valores 1500 y 2200.
  ii) La cantidad de productos cuyo precio esta entre 50 y 100 pesos. }

Program EjercitacionUno;
type
  Cadena=String[50];
  Producto=record
    tipo: Cadena;
    descripcion: Cadena;
    codigo: integer;
    precio:real;
  end;
  Arbol=^nodoA;
  nodoA=record
    info: producto;
    hi: arbol;
    hd: arbol;
  end;

Procedure InsertarEnArbol(var a:arbol; R:producto);
begin
  if(a=nil) then begin
    new(a);
    a^.hi:=nil;
    a^.hd:=nil;
    a^.info:=R;
  end
  else
    if(a^.info.codigo>R.codigo) then
      InsertarEnArbol(a^.hi,r)
    else
      InsertarEnArbol(a^.hd,r)
end;


Procedure LeerRegistro(var r:producto);
begin
  Write('Ingrese tipo de producto: ');
  readln(r.tipo);
  if(r.tipo<>'zzz') then begin
    write('Ingrese descripcion del producto: ');
    readln(r.descripcion);
    write('Ingrese codigo del producto: ');
    readln(r.codigo);
    write('Ingrese precio del producto: ');
    readln(r.precio);
  end;
end;

Procedure CargarArbol(var a:arbol);
var
  r:producto;
begin
  LeerRegistro(r);
  while(R.tipo<> 'zzz') do begin
    InsertarEnArbol(a,r);
    LeerRegistro(r);
  end;
end;

Procedure RecorridoAcotado(a:arbol);          {Punto B-1}
begin
  if(a<>nil) then begin
    if(a^.info.codigo>=1500)then begin
      if(a^.info.codigo<=2200) then begin
        writeln(a^.info.tipo);
        writeln(a^.info.descripcion);
        writeln;
        RecorridoAcotado(a^.hi);
        RecorridoAcotado(a^.hd)
      end else
        RecorridoAcotado(a^.hi)
    end else
      RecorridoAcotado(a^.hd);
  end;
end;

Procedure RecorridoAcotado2(a:arbol;var cant:integer); {Punto B-2}
begin
  if(a<>nil) then begin
    if(a^.info.precio>=50)then begin                {Inf va a ser reemplazado por un valor explicito de la consigna}
      if(a^.info.precio<=100) then begin
        cant:=cant+1;
        RecorridoAcotado2(a^.hi,cant);
        RecorridoAcotado2(a^.hd,cant)
      end else
        RecorridoAcotado2(a^.hi,cant)
    end else
      RecorridoAcotado2(a^.hd,cant);
  end;
end;

var
  a:arbol;
  cant:integer;
begin
  a:=nil;
  cant:=0;
  CargarArbol(a);
  writeln('El tipo y la descripcion de los productos con codigo entre 1500 y 2200 son: ');
  writeln;
  RecorridoAcotado(a); {Los rangos son reemplazados por valores explicitos}
  writeln;
  write('La cantidad de productos cuyo precio esta entre 50 y 100 pesos es: ');
  RecorridoAcotado2(a,cant);
  writeln(cant);
  readln;
end.
