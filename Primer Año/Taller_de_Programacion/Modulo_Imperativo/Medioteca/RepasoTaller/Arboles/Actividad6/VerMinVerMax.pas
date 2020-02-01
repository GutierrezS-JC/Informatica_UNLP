Program BuscarEnArbol;
type
  Lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;
  arbol=^nodoA;
  nodoA=record
    info: integer;
    hi: arbol;
    hd: arbol;
  end;
  ListaNivel=^nodoN;       {Para imprimir por nivel cargamos una lista que contenga al arbol}
  nodoN=record
    datos:arbol;
    sig:listaNivel;
  end;


Procedure AgregarAdelante(var L:lista; num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=L;
  L:=nue;
end;

Procedure CargarLista(Var L:lista);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    AgregarAdelante(L,n);
    n:=random(11);
  end;
end;

Procedure ImprimirLista(L:lista);
begin
  Write('La lista generada es la siguiente: ');
  while(L<>nil) do begin
    write(L^.datos, ' ');
    L:=L^.sig;
  end;
end;

Procedure InsertarEnArbol(var a:arbol; L:Lista);
begin
  if(a=nil) then begin
    new(a);
    a^.info:=L^.datos;
    a^.hi:=nil;
    a^.hd:=nil;
  end
  else
    if(a^.info>L^.datos) then
      insertarEnArbol(a^.hi,L)
    else
      insertarEnArbol(a^.hd,L);
end;

Procedure CargarArbol(var a:arbol; l:lista);
begin
  while(L<>nil) do begin
    InsertarEnArbol(a,l);
    L:=L^.sig;
  end;
end;

Procedure AgregarAtras(var pri:ListaNivel; a:arbol);
var
  nue:listanivel;
  act:listaNivel;
begin
  new(nue);
  nue^.datos:=a;
  nue^.sig:=nil;
  if(pri<>nil) then begin
    act:=pri;
    while(act^.sig<>nil) do
      act:=act^.sig;
    act^.sig:=nue;
  end
  else
    pri:=nue;
end;


Function ContarElementos (L: ListaNivel): integer;        {Devuelve la cantidad de elementos en una lista}
var
  cont: integer;
begin
  cont:= 0;
  While (l <> nil) do begin
    cont:= cont+1;
    L:= L^.sig;
  end;
  ContarElementos:=cont;
end;

Procedure imprimirpornivel(a: arbol);                {Muestra los datos del arbol por niveles}
var
  L,aux: ListaNivel;
  nivel,cant,i: integer;
begin
   L:= nil;
   if(a <> nil)then begin
     nivel:= 0;
     AgregarAtras (L,a);
     while (L<> nil) do begin
       nivel:= nivel + 1;
       cant:= contarElementos(L);
       write ('Nivel ', nivel, ': ');
       for i:= 1 to cant do begin
         write (L^.datos^.info, ' - ');
         if (L^.datos^.HI <> nil) then
           AgregarAtras (L,L^.datos^.HI);
         if (L^.datos^.HD <> nil) then
           AgregarAtras (L,L^.datos^.HD);
         aux:= L;
         L:= L^.sig;
         dispose (aux);
       end;
       writeln;
     end;
   end;
end;

Procedure preOrden(a:arbol);
begin
  if ( a <> nil ) then begin
    write (a^.info, '   ');
    preOrden (a^.HI);
    preOrden (a^.HD);
  end;
end;

Procedure postOrden(a:arbol);
begin
  if ( a <> nil ) then begin
    postOrden (a^.HI);
    postOrden (a^.HD);
    write (a^.info, '   ');
  end;
end;

Procedure enOrden(a:arbol);
begin
  if ( a <> nil ) then begin
    enOrden (a^.HI);
    write (a^.info, '   ');
    enOrden (a^.HD);
 end;
end;

Function Buscar(a:arbol;dato:integer):arbol;
begin
  if(a=nil) then
    Buscar:=nil
  else
    if(dato=a^.info) then
      Buscar:=a
    else
      if(dato<a^.info)then
        Buscar:=Buscar(a^.hi,dato)
      else
        Buscar:=Buscar(a^.hd,dato);
end;

{'-------------------------------------------------------------------------'}

Function verMin(a:arbol):arbol;
begin
  if(a=nil) then
    verMin:=nil
  else
    if(a^.hi=nil) then
      verMin:=a
    else
      verMin:=verMin(a^.hi);
end;

Function verMax(a:arbol):arbol;
begin
  if(a<>nil) then
    while(a^.hd<>nil) do
      a:=a^.hd;
  verMax:=a;
end;

var
  a:arbol;
  l:lista;
  valor:integer;
  a2:arbol;
begin
  a:=nil;
  l:=nil;
  randomize;
  CargarLista(L);
  ImprimirLista(L);
  writeln;
  CargarArbol(a,l);
  ImprimirPorNivel(a);
  writeln;
  {Imprimir Pre,En,Pos orden}

  write('El arbol en orden es el siguiente: ');
  EnOrden(a);
  writeln;
  write('El arbol en post Orden es el siguiente: ');
  PostOrden(a);
  writeln;
  Write('El arbol en pre Orden es el siguiente: ');
  PreOrden(a);
  writeln;

  {Busqueda en el arbol}
  write('Ingrese un valor a buscar en el arbol: ');
  read(valor);
  a2:=Buscar(a,valor);
  if(Buscar(a,valor)<> nil) then
    writeln('Se encontro')
  else
    writeln('No se encontro');
  readln;

  {Ver minimo y maximo}
  a2:=verMin(a);
  if(a2<>nil) then
    write('El numero minimo del arbol es: ', a2^.info);
  writeln;


  a2:=verMax(a);
  if(a2<>nil) then
    write('El numero maximo del arbol es: ', a2^.info);
  readln;
end.
