Program RepasoMergeAcumulador;
const
  dimf=2;
type
  cadena=string[20];
  Consumo=record
    tipo: integer;  {Antes lo pusimos como cadena}
    fecha: cadena;
    monto: integer;
  end;
  Consumo2=record
    tipo:integer;
    monto:integer;
  end;
  lista=^nodo;
  nodo=record
    datos:Consumo;
    sig:lista;
  end;
  lista2=^nodo2;
  nodo2=record
    datos:Consumo2;
    sig:lista2;
  end;

  vector=array[1..dimF] of lista;

{--------------------------------------------------------------}

Procedure InicializarVectorDeListas(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimF do
    V[i]:=nil;
end;

Procedure LeerConsumo(var R:consumo);
begin
  write('Ingrese monto: ');
  R.monto:=random(11);           {El monto esta en random}
  writeln(R.monto);
  if (R.monto<>0)then begin
    write('Ingrese tipo de gasto: ');
    readln(R.tipo);
    write('Ingrese fecha: ');
    readln(R.fecha);
    writeln;
  end;
end;

Procedure InsertarOrdenado(var pri:lista; r:Consumo);
var
  ant, nue, act:lista;
begin
  new(nue);
  nue^.datos:=r;
  act:=pri;
  ant:=pri;
  while(act<>nil) and (act^.datos.tipo<R.tipo) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act) then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

Procedure ImprimirLista(pri:lista; i:integer);
begin
  Write('Lista ',i, ': ');
  while(pri<>nil) do begin
    write(pri^.datos.monto, ' ');
    pri:=pri^.sig;
  end;
  writeln;
  writeln('--------------------------------------------------');
  writeln;
end;

Procedure CargarLista(var v:vector; i:integer);
var
  R:Consumo;
begin
  LeerConsumo(R);
  While(R.monto<>0) do begin
    InsertarOrdenado(V[i],R);
    LeerConsumo(R);
  end;
  ImprimirLista(V[i],i); {en duda}
end;


Procedure CrearVectorDeListas(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimF do
    CargarLista(V,i);
end;

Procedure DeterminarMinimo(var v:vector; var C1:Consumo);
var
  i,ListaMin:integer;
  aux:lista;
begin
  C1.tipo:=999;
  for i:=1 to dimF do
    if(V[i]<>nil) and (V[i]^.datos.tipo<c1.tipo) then begin
      C1:=v[i]^.datos;
      ListaMin:=i;
    end;
  if(c1.tipo<>999) then begin       {antes usamos zzz cuando el tipo era cadena}
    aux:=V[ListaMin]^.sig;
    dispose(V[ListaMin]);
    V[ListaMin]:=aux;
  end;
end;

Procedure AgregarAtras(Var pri:lista2;C2:Consumo2);
var
  nue:lista2;
  act:lista2;
begin
  new(nue);
  nue^.datos:=C2;
  nue^.sig:=nil;
  if(pri<>nil) then begin
    act:=pri;
    while(act^.sig<>nil) do
      act:=act^.sig;
    act^.sig:=nue;
  end
  else
    pri:=nue;
end;


Procedure MergeAcumulador(var v:vector; var pri:Lista2);
var
  C1:Consumo;
  C2:Consumo2;
begin
  {C2.tipo:=999;}      {La profe elimino esta linea}
  C2.monto:=0;
  DeterminarMinimo(v,C1);
  while(C1.tipo<>999) do begin
    C2.tipo:= C1.tipo; {Guarda el consumo actual como minimo}
    while(C1.tipo=C2.tipo) do begin
      C2.monto:=C2.monto + C1.monto;
      DeterminarMinimo(v,C1);
    end;
    AgregarAtras(pri,c2);
    C2.monto:=0;
  end;
end;

procedure ImprimirLista2 (pri:lista2);
begin
  while (pri<>nil) do begin
    writeln('De los gastos del tipo ',pri^.datos.tipo,' se obtuvo un monto de:',pri^.datos.monto);
    writeln('--------------------------------------------------------');
    pri:=pri^.sig;
  end;
end;

var
  v:vector; L2:lista2;
begin
  randomize;
  InicializarVectorDeListas(V);
  CrearVectorDeListas(v);
  MergeAcumulador(v,L2);
  ImprimirLista2(L2);
  readln;
end.


