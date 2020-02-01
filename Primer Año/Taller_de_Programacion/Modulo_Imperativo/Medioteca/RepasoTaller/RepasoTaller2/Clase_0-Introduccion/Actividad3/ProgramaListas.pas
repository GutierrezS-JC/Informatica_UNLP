Program actividadTres;
type
  lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;

Procedure AgregarAdelante(var l:lista;num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=L;
  L:=nue;
end;

Procedure CargarListaAdelante(var l:lista);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    AgregarAdelante(l,n);
    n:=random(11);
  end;
end;

Procedure AgregarAtras(var pri:lista; num:integer);
var
  nue,act:lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=nil;
  if(pri<>nil) then begin
    act:=pri;
    while(act^.sig<>nil) do
      act:=act^.sig;
    act^.sig:=nue
  end
  else
    pri:=nue;
end;

Procedure CargarListaAtras(var l:lista);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    AgregarAtras(l,n);
    n:=random(11);
  end;
end;

Procedure Insertar(var pri:lista; num:integer);
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
  if(ant=act)then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

Procedure CargarOrdenado(var l:lista);  {Insertar Ordenado}
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    Insertar(l,n);
    n:=random(11);
  end;
end;

Procedure Imprimir(l:lista);
begin
  write('La lista generada es la siguiente: ');
  while(l<>nil) do begin
    write(L^.datos,' ');
    l:=l^.sig;
  end;
  writeln;
end;

var
  l:lista;
  l2:lista;
  l3:lista;
begin
  randomize;
  CargarListaAdelante(l);
  Imprimir(l);
  CargarListaAtras(l2);
  Imprimir(l2);
  CargarOrdenado(l3);
  Imprimir(l3);
  readln;
end.



