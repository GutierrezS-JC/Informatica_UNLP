Program ValoresEnRango;
type
  lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;
  arbol=^nodoA;
  nodoA=record
    info:integer;
    hi:arbol;
    hd:arbol;
  end;


Procedure AgregarAdelante(var L:lista; num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=L;
  L:=nue;
end;

Procedure CargarLista(var L:lista);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    AgregarAdelante(L,n);
    n:=random(11);
  end;
end;

Procedure ImprimirLista(L:lista);
begin
  write('La lista generada es la siguiente: ');
  while(l<>nil) do begin
    write(L^.datos, ' ');
    L:=L^.sig;
  end;
end;


Procedure InsertarEnArbol(var a:arbol; num:integer);
begin
  if(a=nil) then begin
    new(a);
    a^.info:=num;
    a^.hi:=nil;
    a^.hd:=nil;
  end
  else
    if(a^.info>num) then
      InsertarEnArbol(a^.hi,num)
    else
      InsertarEnArbol(a^.hd,num);
end;

Procedure CargarArbol(var a:arbol; l:lista);
begin
  while(l<>nil) do begin
    InsertarEnArbol(a,L^.datos);
    L:=L^.sig;
  end;
end;

Procedure EnOrden(a:arbol);
begin
  if(a<>nil) then begin
    EnOrden(a^.hi);
    write(a^.info, ' ');
    EnOrden(a^.hd);
  end;
end;

Procedure RecorridoAcotado(a:arbol; inf,sup:integer);         {Ver valores en rango}
begin
  if(a<>nil) then begin
    if(a^.info>=inf) then begin                  {Si quiero que los valores inf y sup no se incluyan saco el "="}
      if(a^.info<=sup) then begin
        write(a^.info, ' ');
        RecorridoAcotado(a^.hi,inf,sup);
        RecorridoAcotado(a^.hd,inf,sup)
      end else
        RecorridoAcotado(a^.hi,inf,sup)
    end else
      RecorridoACotado(a^.hd,inf,sup);
  end;
end;

var
  L:lista;
  a:arbol;
  inf,sup:integer;
begin
  randomize;
  CargarLista(L);
  ImprimirLista(L);
  writeln;
  writeln;
  CargarArbol(a,l);
  write('El arbol generado (en orden) es el siguiente: ');
  EnOrden(a);
  readln;
  Write('Ingrese un numero como inferior: ');
  readln(inf);
  writeln;
  write('Ingrese un numero como superior: ');
  readln(sup);
  write('Los valores en rango son: ');
  RecorridoAcotado(a,inf,sup);
  readln;
end.
