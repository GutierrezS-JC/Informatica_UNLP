

Program Mergelistas;
Const
     valor_corte= 999999;
Type

  Producto=record
    cod: integer;
    cantidad:integer;
  end;
  Lista= ^Nodo;
  Nodo= Record
           Datos: Producto;
           Sig: Lista;
        End;


{-----------------------------------------------------------------------------
INSERTAR - Inserta num en la lista pri manteniendo el orden creciente}
Procedure Insertar ( var pri: lista; R: producto);
var ant, nue, act: lista;
begin
   new (nue);
   nue^.datos:= R;
   act := pri;
   ant := pri;
   {Recorro mientras no se termine la lista y no encuentro la posici?n correcta  }
    while (act<>NIL) and (act^.datos.cod < r.cod) do begin
      ant := act;
      act := act^.sig ;
   end;
   if (ant = act) then pri := nue   {el dato va al principio }
                  else  ant^.sig  := nue; {el dato va entre otros dos o al final}
   nue^.sig := act ;
end;


{-----------------------------------------------------------------------------
CREARLISTAORDENADA - Genera una lista con n?meros aleatorios ordenados de forma
creciente}
procedure crearListaOrdenada(var l: Lista);
var
  r: producto;
begin
 r.cantidad := random (15);
 r.cod:= random (10);
 While (r.cantidad <> 0) do Begin
   Insertar (L, r);
   r.cantidad := random (15);
   r.cod:= random (10);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIR - Imprime la lista pri}
Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos.cod, ': ');
     write(pri^.datos.cantidad);
     write('-');
     pri:= pri^.sig
  end;
  writeln;
end;
{-----------------------------------------------------------------------------
DETERMINAR MINIMO}
Procedure Determinar_minimo (var L1, L2: Lista; var min:producto);
begin
     if (L1 <> NIL) AND (L2 <> NIL) then begin
        if(L1^.Datos.cod > L2^.Datos.cod)then begin
           min:= L2^.Datos;
           L2 := L2^.sig;
        end
        else begin
           min:= L1^.Datos;
           L1 := L1^.sig;
        end;
     end
     else begin
        if (L1 <> NIL)then begin
           min:= L1^.Datos;
           L1 := L1^.sig;
        end
        else begin
           if(L2 <> NIL) then begin
              min:= L2^.Datos;
              L2 := L2^.sig;
            end
            else
               min.cod:= valor_corte;
         end;
     end;
end;
{-----------------------------------------------------------------------------
AGREGAR AL FINAL}
Procedure agregarAlFinal(var L, ult : Lista; codigo, acumulador: integer);
var
aux: lista;
begin
     new(aux);
     aux^.Datos.cod:= codigo;
     aux^.datos.cantidad:= acumulador;
     aux^.sig:= nil;
     if( L = nil) then begin
         L:=aux;
     end
     else begin
         ult^.sig:= aux;
     end;
     ult:= aux;
end;

Procedure ProgramaAcumulador(var L:lista; L1, L2: Lista);
var
   Min: producto; acumulador:integer; actual:integer;
   ult: lista;
begin
     L:= nil;
     Determinar_minimo(L1,L2,Min);
     while(Min.cod<> valor_corte) do begin
         acumulador:=0;
         actual:= Min.cod;
         while (Min.cod= actual) do
               begin
                    acumulador:=Min.cantidad+acumulador;
                    Determinar_minimo(L1,L2,Min);
               end;
         AgregarAlFinal(L,ult,actual,acumulador);
     end;
end;

Var
   L, L1, L2: Lista;
begin
 randomize;
 L1:=nil;
 L2:=nil;
 CrearListaOrdenada (L1);
 CrearListaOrdenada (L2);
 write ('Lista1: ');
 Imprimir (L1);
 writeln;
 writeln;
 write ('Lista2: ');
 Imprimir (L2);
 ProgramaAcumulador(L, L1, L2);
 write ('Lista Acumulador: ');
 Imprimir(L);
 readln;
end.

