Program Ordenacion ;
Const
Fin=50;
type
 lista=^nodo;
    nodo=record
    Datos:integer;
    sig:lista;
    end;
Vector=Array[1..Fin]of integer;
Procedure cargar (var v:vector);
var
i:integer;
begin
for i:=1 to Fin do
v[i]:=Random(100);
end;
Procedure informar (v:vector);
var
i:integer;
begin
for i:=1 to Fin do  begin
Write(v[i],' | ');
end;
end;
procedure OrdenacionPorInsercion(var V:vector);
var
i,j,actual:integer;
begin
    for i:=2 to fin do begin
        actual:=V[i];
        j:=i-1;
        while (j>0) and (V[j]>actual) do begin
            V[j+1]:=V[j];
            j:=j-1;
        end;
        V[j+1]:=actual;
    end;
end;

procedure buscar(v:vector;ini,fin2:integer;var pos:integer; num:integer);
var medio:integer;
begin
if  (fin2<ini) then
    pos:=0
    else
        medio := (fin2 + ini)div 2;
        if (v[medio]= num) then
           pos:=medio
           else
               if v[medio]>num then
               buscar(v,ini,medio+1,pos,num)
               else
               buscar(v,medio-1,fin2,pos,num)
end;
Procedure agregaratras(Var L:lista;Datos:integer);
Var
Aux:lista;
Begin
New(Aux);
Aux^.Datos:=Datos;
Aux^.sig:=L;
L:=Aux;
End;
Procedure Recursion  (var l:lista; v:vector; var i:integer);
begin

if i< 50 then begin
  if v[i]< 28 then
     agregaratras(l, v[i]);
  i:=i+1;
  Recursion (l,v,i);
  end;
end;


Var
v:Vector ;
fin2:integer;
pos:integer;
num:integer;
ini:integer;
l:lista;
i:integer;
begin
l:=nil;
cargar(v);
write ('EL VECTOR SIN ORDENAR:    ');
informar(v);
OrdenacionPorInsercion(v);
writeln();
writeln();
writeln();
write('EL VECTOR ORDENADO:  ');
informar(v);
writeln();
writeln('Ingresar numero a buscar:');
readln(num);
ini:=1;
fin2:=50;
buscar (v,ini,fin2,pos,num);
writeln ('posicion :', pos);
readln ();
i:=1;
Recursion(l,v,i);
while (l<>nil) do begin
  write(l^.datos,' | ');
  l:=l^.sig;
end;
readln();
end.
