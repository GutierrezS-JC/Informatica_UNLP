Program ActividadDoce;
type
  Lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;

Function Mayor(Num1:integer; num2:integer):integer;          {Devuelve el numero mas grande entre dos parametros}
begin
  If(num1>num2)then
    Mayor:=Num1
  else
    Mayor:=Num2;
end;

Function Menor(num1:integer; num2:integer):integer;          {Devuelve el numero mas chico entre dos parametros}
begin
  if(num1<num2) then
    Menor:=Num1
  else
    Menor:=num2;
end;

Function Minimo(L:lista):integer;              {Devuelve el valor minimo de la lista}
begin
  if(L=nil) then
    Minimo:=999
  else
    Minimo:=Menor(L^.datos,Minimo(L^.sig));
end;

Function Maximo(L:lista):integer;            {Devuelve el mayor numero de la lista}
begin
  if(L=nil) then
    Maximo:=0
  else
    Maximo:=Mayor(L^.datos, Maximo(L^.sig));
end;

Procedure Insertar(var pri:lista; num:integer);
var
  ant,act,nue:lista;
begin
  new(nue);
  nue^.datos:=num;
  act:=pri;
  ant:=pri;
  while(act<>nil) and (act^.datos<num) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act) then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

Procedure CargarLista(var L:lista);     {Carga la lista con un numero aleatorio y lo inserta ordenado hasta que llegue un valor 0}
var
  n:integer;
begin
  n:=random(10);
  while(n<>0) do begin
    Insertar(L,n);
    n:=random(10);
  end;
end;

Procedure ImprimirLista(L:lista);                       {Imprime la lista}
begin
  write('La lista generada es la siguiente: ');
  while(L<>nil) do begin
    write(L^.datos, ' ');
    L:=L^.sig;
  end;
end;

Function Buscar(L:lista; num:integer):boolean;         {Retorna un valor booleano que indica si el dato esta o no en la lista}
begin
  if(L=nil) then
    Buscar:=false
  else
    if(num=L^.datos) then
      Buscar:=True
    else
      if(num<>L^.datos) then       {Esta linea se puede omitir, es un recordatorio de la condicion para la recursion}{Si no lo encontre, busco en el que sigue}
        Buscar:=Buscar(L^.sig,num);
end;

var
  L:lista; num:integer;
begin
  randomize;
  CargarLista(L);
  ImprimirLista(L);
  writeln;
  writeln;
  Write('El valor maximo de la lista es: ', Maximo(L));
  writeln;
  write('El valor minimo de la lista es: ', Minimo(L));
  writeln;
  write('Ingrese el dato a buscar en la lista: ');
  readln(num);
  writeln;
  if(buscar(L,num)) then
    writeln('El dato se encontro')
  else
    writeln('El dato no se encontro');
  readln;
end.
