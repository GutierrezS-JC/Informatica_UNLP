Program OrdenacionVector;
const
  dimF=8;
type
  Vector=array[1..dimF] of integer;

Procedure CrearVector(var v:vector;var diml:integer);          {Si quiero que cargue todo el vector si otra condicion uso el for i:=1 to dimf}
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) and (dimL<dimf) do begin
    diml:=diml+1;
    V[dimL]:=n;
    n:=random(11);
  end;
end;

Procedure ImprimirVector(var v:vector; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do
    write('-----');
  writeln;
  write(' ');
  for i:=1 to dimL do begin
    if(V[i]<10) then
      write('0');
    write(V[i],' | ');
  end;
  writeln;
  for i:=1 to dimL do
    write('-----');
  writeln;
  writeln;
end;

Procedure OrdenacionPorInsercion(var v:vector; dimL:integer);
var
  i,j,dato:integer;
begin
  for i:=2 to dimL do begin
    dato:=V[i];
    J:=i-1;
    while(j>0) and (V[J]>dato) do begin
      V[J+1]:=V[J];
      J:=J-1;
    end;
    V[J+1]:=dato;
  end;
end;

Var
  v:vector;
  diml:integer;
begin
  randomize;
  diml:=0;
  CrearVector(v,diml);
  writeln('El vector generado es el siguiente: ');
  ImprimirVector(v,diml);
  writeln('El vector ordenado es el siguiente: ');
  OrdenacionPorInsercion(v,diml);
  ImprimirVector(v,diml);
  readln;
end.

