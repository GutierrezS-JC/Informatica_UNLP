Program Merge4Listas;
const
  dimF=4;
type
  libros=record
    isbn:integer;
  end;
  lista=^nodo;
  nodo=record
    datos:libros;
    sig:lista;
  end;
  vector=array [1..dimF] of Lista;

Procedure InicializarVector(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimf do
    v[i]:=nil;
end;

Procedure Insertar(Var pri:lista;r:libros);
var
  ant,nue,act:lista;
begin
  new(nue);
  nue^.datos:=r;
  act:=pri;
  ant:=pri;
  while(act<>nil) and (act^.datos.isbn<r.isbn) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

Procedure ImprimirLista(l:lista);
begin
  while (l<>nil) do begin
    write(l^.datos.isbn, ' ');
    l:=l^.sig;
  end;
end;

Procedure CrearListaOrdenada(var v:vector; i:integer);               {Cargar Lista}
var
  r:libros;
begin
  r.isbn:=random(11);
  while(r.isbn<>0) do begin
    Insertar(V[i],r);
    r.isbn:=random(11);
  end;
  write('La lista generada es la siguiente: ');
  ImprimirLista(V[i]);
  writeln;
end;

Procedure CrearVector4Listas(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimf do
    CrearListaOrdenada(v,i);
end;

Procedure AgregarAtras(var pri:lista; min:integer);
var
  nue:lista;
  act:lista;
begin
  new(nue);
  nue^.datos.isbn:=min;
  nue^.sig:=nil;
  if(pri<>nil)then begin
    act:=pri;
    while(act^.sig<>nil)do
      act:=act^.sig;
    act^.sig:=nue
  end
  else
    pri:=nue;
end;

Procedure DeterminarMinimo(var v:vector; var min:integer);
var
  i,ListaMin:integer;
  aux:lista;
begin
  min:=999;
  for i:=1 to dimF do begin
    if(V[i]<> nil) and (V[i]^.datos.isbn<min) then begin
      min:=V[i]^.datos.isbn;
      ListaMin:=i;
    end;
  end;
  if(min<>999) then begin
    aux:=v[ListaMin]^.sig; {Agarro el siguiente de la lista donde encontre el minimo}
    dispose(V[ListaMin]);  {Elimino el nodo anterior de la lista donde encontre el minimo ya que estoy parado en el siguiente}
    V[ListaMin]:=aux;      {Asigno en la lista donde encontre el minimo el siguiente que estaba guardado en aux}
  end;
end;

Procedure Merge4(var v:vector; var L2:lista);
var
  min:integer;
begin
  DeterminarMinimo(v,min);
  while(min<>999) do begin
    AgregarAtras(L2,min);    {El determinarMinimo me devuelve el min en una variable, no usa el vector}
    DeterminarMinimo(v,min);
  end;
end;

Var
  l:lista;
  v:vector;
begin
  l:=nil;
  randomize;
  InicializarVector(v);
  CrearVector4Listas(v);
  Merge4(v,l);
  write('La lista generada por el merge es la siguiente: ');
  ImprimirLista(l);
  readln;
end.

