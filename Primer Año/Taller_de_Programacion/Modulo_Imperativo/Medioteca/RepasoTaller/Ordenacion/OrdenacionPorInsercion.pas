Program OrdenacionVectores;
const
  dimf=8;
type
  vector=array[1..dimf]of integer;

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

procedure CargarVector (var v:vector; var diml:integer);
var
  n:integer;
begin
  randomize;
  diml:=0;
  n:=random(10);
  while(diml<dimf)and(n<>0)do begin
    diml:=diml+1;
    v[diml]:=n;
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

var
  diml:integer;
  v:vector;
begin
  CargarVector (v,diml);
  ImprimirVector(v,diml);
  OrdenacionInsercion(v,diml);
  ImprimirVector(v,diml);
  readln();
end.
