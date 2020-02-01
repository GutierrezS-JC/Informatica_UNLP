Program encomiendas;
Type
  encomienda = record
    codigo: integer;
    peso: integer;
  end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;

  //Lista De Codigos
  listacod= ^nodocod;
  nodocod= record
    dato: integer;
    sig:listacod;
  end;

  //Campo Dato Del Arbol
  Registro = record
       Lc: listacod;
       peso:integer;
      end;

  //Estructura Del Arbol
  arbol = ^nodoA;
  NodoA = record
        dato: registro;
        hi: arbol;
        hd: arbol;
  end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}

procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }

procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{------------------------------------------------------------------------------
AGREGARAL - AGREGA EL CODIGO EN LA LISTA DE CODIGOS DEL PESO DEL NODO DEL ARBOL}

Procedure agregarAl (var l: listacod; cod: integer);
var
   nue: listacod;
begin
   new(nue);
   nue^.dato:= cod;
   if(l=nil) then
     l:=nue
   else begin
    nue^.sig:= l;
    l:=nue;
   end;
end;

{--------------------------------------------------------------------------
INSERTAR - CARGA EL ARBOL}

procedure insertar( var a:arbol; r: encomienda);
var
  nue:arbol;
begin
  if(a=nil) then begin
    new(nue);
    nue^.hi:= nil;
    nue^.hd:= nil;
    nue^.dato.peso:= r.peso;
    agregarAl(nue^.dato.lc , r.codigo);
    a:= nue;
  end
  else
      if (a^.dato.peso > r.peso) then
         insertar(a^.hd,r)
      else begin
         if (a^.dato.peso < r.peso) then
            insertar(a^.hi,r)
         else
            agregarAl(a^.dato.lc, r.codigo);
      end;
end;

{----------------------------------------------------------------------------
RECORRERLISTA - RECORRE LA LISTA ENVIANDO CADA NODO A EL INSERTAR}

procedure Recorrerlista( var a:arbol; l:lista);
begin
  a:= nil;
  while(l<>nil) do begin
    insertar(a,l^.dato);
    l:=l^.sig;
  end;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }

procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

{----------------------------------------------------------------------------
IMPRIMIRLISTA2 - Imprime Los Codigos Con El Mismo Peso}

procedure imprimirLista2(l: Listacod);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato);
   l:= l^.sig;
 End;
end;

{----------------------------------------------------------------------------
ENORDEN - Imprime los nodos del arbol en orden de peso}

Procedure EnOrden(a:arbol);
begin
  if (a<>nil) then begin
    EnOrden(a^.hi);
    writeln('peso: ',a^.dato.peso);
    ImprimirLista2(a^.dato.lc);
    EnOrden(a^.hd);
  end;
end;

{----------------------------------------------------------------------------
PROGRAMA PRINCIPAL}

Var

 l: lista; a:arbol;

begin
 Randomize;

 crearLista(l);
 a:= nil;
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 RecorrerLista(a,l);
 EnOrden(a);
 readln;
end.

