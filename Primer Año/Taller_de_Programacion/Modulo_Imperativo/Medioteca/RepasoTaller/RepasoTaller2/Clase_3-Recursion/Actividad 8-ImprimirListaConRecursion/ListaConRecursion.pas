Program ListaConRecursion;
type
  lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;

Procedure AgregarAtras(var pri:lista; num:integer);
var
  nue: lista;
  act: lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=nil;
  if(pri<>nil)then begin
    act:=pri;
    while(act^.sig<>nil)do
      act:=act^.sig;
    act^.sig:=nue;
  end
  else
    pri:=nue;
end;

Procedure CrearLista(var l:lista);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    AgregarAtras(l,n);
    n:=random(11);
  end;
end;

Procedure Imprimir(l:lista);
begin
  while(l<>nil) do begin
    write(l^.datos, ' ');
    l:=l^.sig;
  end;
end;

Procedure ImprimirEnOrden(l:lista);   {Imprime en el orden en que se guardaron}
var
  dig:integer;
begin
  if(l<>nil) then begin
    dig:=l^.datos;
    write(dig, ' ');
    ImprimirEnOrden(l^.sig);
  end;
end;

Procedure ImprimirEnOrdenInverso(l:lista); {Imprime desde el ultimo dato guardado hasta el primero}
var
  dig:integer;
begin
  if(l<>nil) then begin
    dig:=l^.datos;
    ImprimirEnOrdenInverso(l^.sig);
    write(dig, ' ');
  end;
end;

var
  l:lista;
begin
  randomize;
  l:=nil;
  CrearLista(l);
  Imprimir(l);
  writeln;
  write('La lista impresa en el orden en que se guardaron es: ');
  ImprimirEnOrden(l);
  writeln;
  write('La lista impresa desde el ultimo dato guardado hasta el primero: ');
  ImprimirEnOrdenInverso(l);
  readln;
end.
