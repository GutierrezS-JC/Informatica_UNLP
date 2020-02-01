{Genera un vector que despues se ordena por insercion y se busca un dato dentro del vector por busquedaDicotomica e imprime el resultado}

program BusquedaDicotomicas;
const
  dimf=8;
type
  indice=1..dimf;
  vector=array [indice] of integer;
{----------------------------------------------------------------------------------------------}

Procedure busquedaDicotomica(v:vector;ini,fin:indice;dato:integer;var pos:indice);
var
  medio:indice;
begin
  medio:=ini+(fin-ini)div 2;                 {Tomo la mitad}
  if(ini=fin)and(v[medio]<>dato) then
   writeln('no se encontro el valor')
  else begin
   if (v[medio]=dato) then  {Si es el dato}
     pos:=medio
   else begin       {Si no es el dato}
     if (v[medio]>dato) then
       busquedaDicotomica(v,ini,(medio-1),dato,pos)  {Si esta en la posicion de abajo}
     else
       busquedaDicotomica(v,(medio+1),fin,dato,pos);  {Si esta en la posicion de arriba}
   end;
  end;
end;

procedure OrdenacionInsercion (var v:vector; diml:integer);
var
  i,j,dato:integer;
begin
  for i:=2 to diml do begin
    dato:=v[i];
    j:=i-1;
    while (j>0)and(v[j]>dato) do begin
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=dato;
  end;
end;

{CARGARVECTOR- Carga nros aleatorios entre 0 y 9 en el
vector hasta que llegue el nro 0 o hasta que se complete el vector}

procedure CargarVector (var v:vector; var dimL:integer);
var
  n:integer;
begin
  dimL:=0;
  n:=random(10);
  while(dimL<dimf)and(n<>0)do begin
    dimL:=dimL+1;
    v[dimL]:=n;
    n:=random(10);
  end;
end;



Procedure ImprimirVector ( var vec: vector; var dimL: integer );
var
   i: integer;
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
End;

{----------------------------------------------------------------------------------------}

var
  v:vector;
  diml:integer;
  dato:integer;
  pos:indice;
begin
  randomize;       {Inicializa la secuencia random a partir de una semilla}
  CargarVector(v,diml);
  OrdenacionInsercion(v,diml);
  imprimirvector(v,diml);
  writeln('Ingrese numero a buscar');
  readln(dato);
  busquedaDicotomica(v,1,diml,dato,pos);
  if (pos<>0)then
    writeln('El numero se encuentra en la posicion: ',pos);
  readln();
end.
