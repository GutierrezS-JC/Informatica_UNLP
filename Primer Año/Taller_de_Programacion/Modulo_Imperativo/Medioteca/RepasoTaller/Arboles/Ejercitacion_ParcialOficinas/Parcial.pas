Program repasoOficinas;
const
  dimF=300;
type
  indice=1..dimF;
  oficina=record
    cod_ide:integer;
    dni:integer;
    valor:real;
  end;
  vector=array[1..dimF] of oficina;
  Lista=^nodo;
  nodo=record
    datos: integer;
    sig: lista;
  end;

Procedure LeerRegistro(Var R:oficina);
begin
  write('Ingrese codigo de identificacion: ');
  readln(R.cod_ide);
  if(R.cod_ide<>-1) then begin
    write('Ingrese DNI del propietario: ');
    readln(R.dni);
    write('Ingrese valor de la expensa: ');
    readln(r.valor);
  end;
  writeln;
end;

Procedure CargarVector(var v:vector;var diml:integer);
var
  r:oficina;
begin
  LeerRegistro(R);
  while(R.cod_ide<>-1) and (dimL<dimF)do begin
    dimL:=dimL +1;
    V[dimL]:=R;
    LeerRegistro(R);
  end;
end;

Procedure OrdenarVector(var v:vector; dimL:integer);
var
  i,j:integer;
  dato:oficina;
begin
  for i:=2 to dimL do begin
    dato:=V[i];
    J:=i-1;
    while(J>0) and (V[J].cod_ide> dato.cod_ide) do begin
      V[J+1]:= V[J];
      J:= J-1;
    end;
    V[J+1]:=dato;
  end;
end;

Procedure BusquedaDicotomica(v:vector; ini, fin:indice; dato:integer; var pos:indice);
var
  medio: indice;
begin
  medio:=(ini+(fin-ini) div 2);
  if(ini=fin) and (V[medio].cod_ide<>dato) then
    writeln('No se encontro el valor')
  else begin
    if(V[Medio].cod_ide=dato) then begin
      pos:=medio;
      writeln('El DNI del propietario del codigo de identificacion de oficina es: ', V[pos].dni);
    end else
    begin
      if(V[medio].cod_ide>dato) then
        BusquedaDicotomica(v,ini,(medio-1),dato,pos)
      else
        BusquedaDicotomica(v,(medio+1),fin,dato,pos);
    end;
  end;
end;

Procedure AgregarAdelante(Dato:oficina;var L:lista);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=Dato.cod_ide;
  nue^.sig:=L;
  L:=nue;
end;

Procedure Punto_D(valor:real; var L:lista; v:vector; dimL:integer);          {El valor es un inf}
begin
  if(dimL<dimf) then begin
   if(V[dimL].valor>valor)then
     AgregarAdelante(V[dimL],L);
   dimL:=dimL+1;
   Punto_D(valor,L,v,dimL);
  end;
end;

Procedure ImprimirLista(L:lista);
begin
  write('La lista enlazada con los codigos de oficina cuyo valor de expensa es superior al valor recibido es: ');
  while(L<>nil) do begin
    Write(L^.datos, ' ');
    L:=L^.sig;
  end;
end;

Procedure ImprimirVector(var v:vector;dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do begin
    Writeln('El codigo de identificacion es: ', V[i].cod_ide);
    writeln('El dni es: ', V[i].dni);
    writeln('El valor es: ', V[i].valor);
    writeln;
  end;
end;

var
  v:vector;
  dimL:integer;
  l:lista;
  dato:integer;
  pos:indice;
begin
  l:=nil;
  dimL:=0;
  CargarVector(v,dimL);
  writeln('El vector generado es el siguiente: ');
  ImprimirVector(v,dimL);
  writeln;
  Writeln('El vector ordenado por codigo es el siguiente: ');
  OrdenarVector(v,diml);
  ImprimirVector(v,dimL);
  write('Indique un codigo de identificacion de oficina: ');
  readln(dato);
  writeln;
  BusquedaDicotomica(v,1,dimL,dato,pos);
  writeln;
  readln;
  write('Ingrese un valor de expensa: ');
  readln(dato);
  dimL:=1;
  Punto_D(dato,L,v,dimL);
  ImprimirLista(L);
  readln;
end.
