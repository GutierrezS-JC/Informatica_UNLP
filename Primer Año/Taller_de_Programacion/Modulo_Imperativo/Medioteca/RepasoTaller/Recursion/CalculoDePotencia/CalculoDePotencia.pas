Program CalculoDePotencia;

Function Potencia (base,exponente:integer):LongInt;
begin
  if(exponente=0) then
    potencia:=1
  else
    potencia:= Base*Potencia(base,exponente-1);
end;

var
  base, exponente:integer;
begin
  Write('Ingrese el numero base: ');
  readln(base);
  writeln;
  write('Ingrese el numero exponente: ');
  readln(exponente);
  writeln;
  write('El numero ', base, ' elevado a ', exponente , ' da como resultado: ', Potencia(base,exponente));
  readln;
end.
