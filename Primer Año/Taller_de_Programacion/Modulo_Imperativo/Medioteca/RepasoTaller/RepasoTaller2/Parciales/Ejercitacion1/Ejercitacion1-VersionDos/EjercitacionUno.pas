Program RepasoParcialUno;
type
  cadena=string[50];
  productos=record
    tipo:cadena;
    descripcion:cadena;
    codigo:integer;
    precio:real;
  end;
  ProductosArbol=record
    tipo: cadena;
    descripcion: cadena;
    precio:real;
  end;
  arbol=^nodoA;
  nodoA=record
    info: ProductosArbol;
    codigoA:integer;
    hi: arbol;
    hd: arbol;
  end;

Procedure LeerRegistro(var R:Productos);
begin
  write('Ingrese tipo de producto: ');
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

Procedure Insertar(Var a:arbol; r:Productos);
begin
  if (a=nil) then begin
    new(a);
    a^.info.tipo:=r.tipo;
    a^.info.descripcion:=r.descripcion;
    a^.codigoA:=r.codigo;
    a^.info.precio:=r.precio;
    a^.codigoA:=r.codigo;
  end
  else
    if(r.codigo<a^.codigoA) then
      Insertar(a^.hi,r)
    else
      Insertar(a^.hd,r);
end;


Procedure CargarArbol(var a:arbol);
var
  r:Productos;
begin
  LeerRegistro(r);
  while(r.tipo<>'zzz') do begin
    Insertar(a,r); {en arbol}
    LeerRegistro(r);
  end;
end;

Procedure RecorridoAcotado(a:arbol);  {Punto1}
begin
  if(a<>nil) then begin
    if(a^.codigoA>=1500) then begin
      if(a^.codigoA<=2200) then begin
        writeln('Tipo: ',a^.info.tipo);
        writeln('Descripcion: ', a^.info.descripcion);
        RecorridoAcotado(a^.hi);
        RecorridoAcotado(a^.hd);
      end else
        RecorridoAcotado(a^.hi);
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
  writeln('El tipo y descripcion de los productos cuyo codigo esta entre los valores 1500 y 2200 es: ');
  RecorridoAcotado(a);
  writeln;
  RecorridoAcotado2(a,cant); {Punto b2}
  write('La cantidad de productos cuyo precio esta entre 50 y 100 pesos es: ');
  writeln(cant);
  readln;
end.
