Program NumeroAleatorio;
Procedure Contar(var cant: integer);
var
  num:integer;
  valor:integer;
begin
  num:=random(11);
  write('Ingrese un valor: ');
  readln(valor);
  while(valor<>5) do begin
    if(valor=num) then begin
      cant:=cant+1;
      write('Los numeros coinciden');
    end else
      write('Los numeros no coinciden');
    writeln;
    write('Ingrese un valor: ');
    readln(valor);
    num:=random(11);
  end;
end;

var
  cant:integer;
begin
  randomize;
  cant:=0;
  Contar(cant);
  writeln('La cantidad de coincidencias encontradas es: ', cant);
  readln;
end.
