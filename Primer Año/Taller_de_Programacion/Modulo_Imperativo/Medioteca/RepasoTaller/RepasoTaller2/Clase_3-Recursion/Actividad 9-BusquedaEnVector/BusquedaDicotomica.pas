Program Busqueda;
const
  dimf=10;
type
  vector=array[1..dimF] of integer;
  indice=1..15;

Procedure CrearVector(var v:vector; var diml:integer);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) and (diml<dimf) do begin
    diml:=diml+1;
    V[diml]:=n;
    n:=random(11);
  end;
end;

Procedure OrdenarPorInsercion(var v:vector; diml:integer);
var
  i,j,dato:integer;
begin
  for i:=1 to dimL do begin
    dato:= V[i];
    J:=i-1;
    while(j<>0) and (V[j]>dato) do begin
      V[J+1]:=V[J];
      J:=J-1;
    end;
    V[J+1]:=dato;
  end;
end;

Procedure BusquedaDicotomica(v:vector; ini,fin:indice; dato:integer; var pos:indice);
var
  medio:indice;
begin
  medio:=ini+(fin-ini) div 2;
  if(ini=fin) and (V[medio]<>dato) then
    writeln('No se encontro el valor')
  else begin
    if(V[medio]=dato)then
      pos:=medio
    else begin
      if(V[medio]>dato) then
        BusquedaDicotomica(v,ini,(medio-1),dato,pos)
      else
        BusquedaDicotomica(v,(Medio+1),fin,dato,pos);
    end;
  end;
end;

Procedure ImprimirVector(v:vector; diml:integer);
var
  i:integer;
begin
  for i:=1 to diml do
    write('-----');
  writeln;
  write(' ');
  for i:=1 to dimL do begin
    if(V[i]<10) then
      write('0');
    write(V[i], ' | ');
  end;
  writeln;
  for i:=1 to dimL do
    write('-----');
  writeln;
  writeln;
end;

var
  v:vector;
  diml:integer;
  num:integer;   {dato}
  pos:indice;
begin
  randomize;
  diml:=0;
  CrearVector(v,diml);
  writeln('El vector generado con numero aleatorios es: ');
  imprimirVector(v,diml);
  OrdenarPorInsercion(v,diml);
  writeln('El vector ordenado es: ');
  ImprimirVector(v,diml);
  writeln;
  write('Ingrese un numero a buscar en el vector: ');
  readln(num);
  BusquedaDicotomica(v,1,diml,num,pos);
  if (pos<>0)then
    writeln('El numero se encuentra en la posicion: ',pos);
  readln;
end.




