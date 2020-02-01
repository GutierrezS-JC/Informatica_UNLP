Program CalculoDePotencia;

Function Potencia(base,exponente:integer):LongInt;
begin
  if(exponente=0) then
    potencia:=1
  else
    potencia:=base*potencia(base,exponente-1);
end;

var
  base,exponente:integer;
begin
  write('Ingrese el numero base: ');
  readln(base);
  write('Ingrese el numero exponente: ');
  readln(exponente);
  write('El numero ',base,' elevado al numero exponente ',exponente, ' es: ', Potencia(base,exponente));
  readln;
end.

