Program ActividadCuatro;
const
  dimF=15;
type
  vector=array[1..dimF] of integer;

Procedure CrearVector(var v:vector;var dimL:integer);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) and (dimL<dimF) do begin               {Si quiero cargar todo el vector uso un for I:=1 to do dimf}
    dimL:=diml+1;
    V[diml]:=n;
    n:=random(11);
  end;
end;

Procedure ImprimirVector(v:vector; diml:integer);
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
  for i:=1 to diml do
    write('-----');
  writeln;
  writeln;
end;

var
  v:vector;
  diml:integer;
begin
  randomize;
  diml:=0;
  CrearVector(v,diml);
  writeln('El vector generado es el siguiente');
  ImprimirVector(v,diml);
  readln;
end.


