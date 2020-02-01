Program VectoresRepaso;
const
  dimF=8;
type
  dim=0..dimF;
  vector=array[1..dimF] of integer;

Procedure CargarVector(var v:vector; var dimL:dim);        {Cargar el vector con numeros entre 0 y 10 hasta que llegue el numero 0 o hasta que se complete el vector}
var
  n:integer;
begin
  randomize;
  dimL:=0;
  n:=random(11);
  while(dimL<dimF) and (n<>0) do begin
    dimL:=dimL+ 1;
    v[dimL]:=n;
    n:=random(11);
  end;
end;

Procedure imprimirVector ( var vec: vector; var dimL: dim );         {Imprime todos los numeros del vector}
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 10)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
end;

Function Mayor(num1:integer;num2:integer):integer;   {Devuelve el numero mas grande entre dos parametros}
begin
  if(num1>num2) then
    Mayor:=num1
  else
    Mayor:=num2;
end;

Function Maximo(v:vector; dimL:dim):integer;         {Calcula el numero mas grande del vector}
begin
  if(dimL=0) then
    Maximo:=0
  else
    Maximo:=Mayor(V[dimL],Maximo(V,(dimL-1)));
end;

Function Suma(V:vector; dimL:dim):integer;           {Suma todos los elementos del vector}
begin
  if(dimL=0) then
    suma:=0
  else
    suma:=V[dimL]+suma(v,(dimL-1));
end;


var
  v:vector;
  dimL:dim;
begin
  CargarVector(v,dimL);
  ImprimirVector(V,dimL);
  write('El maximo valor del vector generado es: ', Maximo(v,dimL));
  writeln;
  write('La suma de todos los valores contenidos en el vector es de: ', Suma(V,dimL));
  readln;
end.

