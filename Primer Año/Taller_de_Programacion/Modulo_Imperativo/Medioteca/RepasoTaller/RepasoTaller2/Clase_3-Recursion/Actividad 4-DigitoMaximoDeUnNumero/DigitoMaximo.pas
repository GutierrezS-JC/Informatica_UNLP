Program Recursion;

Procedure DigitoMaximo(num:integer; var max:integer);
var
  dig:integer;
begin
  if(num<>0) then begin
    dig:= num mod 10;
    if(dig>max) then
      max:=dig;
    num:=num div 10;
    digitoMaximo(num,max);
  end;
end;

var
  num,max:integer;
begin
  max:=-1;
  Write('Ingrese un numero: ');
  readln(num);
  DigitoMaximo(num,max);
  write('El digito maximo del numero ingresado es: ',max);
  readln;
end.
