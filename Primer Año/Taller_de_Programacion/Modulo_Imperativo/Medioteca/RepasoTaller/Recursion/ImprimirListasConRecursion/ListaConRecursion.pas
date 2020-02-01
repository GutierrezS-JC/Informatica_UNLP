Program ListaConRecursion;
type
  lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;

Procedure Insertar(var pri:lista;num:integer);
var
  ant,nue,act:lista;
begin
  new(nue);
  nue^.datos:=num;
  act:=pri;
  ant:=pri;
  while(act<>nil) and (act^.datos<num) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act) then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;


Procedure CargarLista(var L:Lista);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    Insertar(L,n);
    n:=random(11);
  end;
end;

Procedure ImprimirEnOrden(L:lista);
var
  dig:integer;
begin
  if(L<>niL) then begin
    dig:=L^.datos;
    Writeln(dig);
    ImprimirEnOrden(L^.sig);
  end;
end;

Procedure ImprimirOrdenInverso(L:Lista);
var
  dig:integer;
begin
  if(L<>Nil) then begin
    dig:=L^.datos;
    ImprimirOrdenInverso(L^.sig);
    writeln(dig);
  end;
end;

var
  L:lista;
begin
  Randomize;
  CargarLista(L);
  Writeln('Valores contenidos en la lista en el orden en el que se guardaron: ');
  ImprimirEnOrden(L);
  writeln;
  writeln('Valores contenidos en la lista en el orden inverso al que se guardaron: ');
  ImprimirOrdenInverso(L);
  readln;
end.
