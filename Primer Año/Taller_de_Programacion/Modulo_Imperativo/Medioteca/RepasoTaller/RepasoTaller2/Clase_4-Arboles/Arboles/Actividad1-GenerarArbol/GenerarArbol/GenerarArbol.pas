Program GenerarArbol;
type
  Lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;
  Arbol=^nodoA;
  nodoA=record
    datos:integer;
    hi:arbol;
    hd:arbol;
  end;
  ListaNivel=^nodoN;
  nodoN=record
    info:arbol;
    sig:ListaNivel;
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

Procedure CargarLista(var L:lista);
var
  n:integer;
begin
  n:=random(11);
  while(n<>0) do begin
    AgregarAdelante(L,n);
    n:=Random(11);
  end;
end;

Procedure ImprimirLista(L:lista);
begin
  while(L<>nil) do begin
    write(L^.datos, ' ');
    L:=L^.sig;
  end;
end;

Procedure Insertar(var A:arbol; num:integer);
begin
  if(a=nil)then begin
    new(A);
    A^.datos:=num;
    A^.hi:=nil;
    A^.hd:=nil;
  end
  else
    if(num<A^.datos) then
      Insertar(a^.hi,num)
    else
      Insertar(a^.hd,num);
end;

{Procedure Insertar (var a: arbol;Num: integer);                //Insertar sin repetidos
var
   nue: arbol;
begin
     if (a= nil) then
        begin
             new(nue);
             nue^.datos:= Num;
             nue^.hi:= nil;
             nue^.hd:= nil;
             a:= nue
         end
     ELSE
         Begin
              If (a^.datos > Num) then
                 insertar (a^.hi, Num)
              else
                  If (a^.datos < Num) then
                     insertar(a^.hd, Num);
         end;
end;                                                    }

Procedure AgregarAtras(var pri:listanivel; a:arbol);
var
  nue:listanivel;
  act:listanivel;
begin
  new(nue);
  nue^.info:=a;
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

Procedure recorrerEinsertar (Var a:arbol; L:lista);    {Cargar Arbol}
Begin
  While (L <> nil) do begin
    insertar(a,L^.Datos);
    L:= L^.Sig;
  end;
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
         write (L^.info^.datos, ' - ');
         if (L^.info^.HI <> nil) then
           AgregarAtras (L,L^.info^.HI);
         if (L^.info^.HD <> nil) then
           AgregarAtras (L,L^.info^.HD);
         aux:= L;
         L:= L^.sig;
         dispose (aux);
       end;
       writeln;
     end;
   end;
end;

var
  L:lista;
  a:arbol;
begin
  Randomize;
  CargarLista(L);
  write('La lista generada es la siguiente: ');
  ImprimirLista(L);
  writeln;
  recorrerEinsertar(a,l);
  ImprimirPorNivel(a);
  readln;
end.
