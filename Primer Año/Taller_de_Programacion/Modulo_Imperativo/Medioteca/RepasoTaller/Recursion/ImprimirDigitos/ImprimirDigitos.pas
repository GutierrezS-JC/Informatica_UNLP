program ImprimirDigitos;

procedure ImprimirDigitos1(num:integer);   {Imprime empezando por la unidad}
var
  dig:integer;
begin
  if (num<>0) then  begin
    dig:=num mod 10;
    write(dig);
    ImprimirDigitos1(num div 10);
  end;
end;

procedure ImprimirDigitos2(num:integer);     {Imprime finalizando con la unidad}
var
  dig:integer;
begin
  if (num<>0) then  begin
    dig:=num mod 10;
    ImprimirDigitos2(num div 10);
    write(dig);
  end;
end;

var
  num:integer;
begin
  write('Ingrese un numero: ');
  readln(num);
  write('La impresion empezando por la unidad es: ');
  ImprimirDigitos1(num);
  writeln;
  write('La impresion finalizando con la unidad es: ');
  ImprimirDigitos2(num);
  readln;
end.
