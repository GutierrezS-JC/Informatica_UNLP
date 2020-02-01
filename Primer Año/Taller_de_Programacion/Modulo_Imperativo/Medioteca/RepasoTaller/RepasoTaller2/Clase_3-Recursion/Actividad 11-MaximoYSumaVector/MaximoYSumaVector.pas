Program CalcularMaximo;
const
  dimf=11;
type
  vector=array[1..dimF] of integer;
  indice=1..dimf;

Function Mayor (num1:integer; num2:integer):integer;
begin
  if(num1>num2) then
    mayor:=num1
  else
    mayor:=num2;
end;

Function Maximo(v:vector;diml:indice): integer;
begin
  if(diml=0) then
    maximo:=0
  else
    maximo:=Mayor(V[diml],maximo(v,(diml-1)));
end;

Function suma(v:vector; diml:indice):integer;
begin
  if(diml=0) then
    suma:=0
  else
    suma:=V[diml]+suma(v,diml-1);
end;

Procedure CrearVector(var v:vector; var diml:integer);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) and (dimL<dimF) do begin
    diml:=diml+1;
    V[diml]:=n;
    n:=random(11);
  end;
end;

Procedure ImprimirVector(v:vector; diml: integer);
var
  i:integer;
begin
  for i:=1 to diml do
    write('-----');
  writeln;
  write(' ');
  for i:=1 to diml do begin
    if(V[i]<10) then
      write('0');
    write(V[i], ' | ');
  end;
  writeln;
  for i:=1 to diml do
    write('-----');
  writeln;
  writeln;
end;

var
  v:vector; diml:integer;
begin
  randomize;
  diml:=0;
  CrearVector(v,diml);
  writeln('El vector generado es: ');
  ImprimirVector(v,diml);
  writeln;
  Writeln('El valor maximo del vector es : ', Maximo(v,diml));
  writeln;
  writeln('La suma de los valor contenidos en el vector es: ', suma(v,diml));
  readln;
end.



