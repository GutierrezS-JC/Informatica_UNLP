{El administrador de un edificio de oficinas, cuenta en papel con la informacion del pago de las expensas de dichas oficinas.

A) Genere un vector sin orden con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa codigo de identificacion, dni del propietario y valor de la expensa.
   La lectura finaliza cuando llega el codigo de identificacion -1.

B) Ordene el vector aplicando el metodo de insercion para obtener el vector ordenado por codigo de identificacion de la oficina.

C) Realice una busqueda dicotomica que recibe el vector generado en b) y un codigo de identificacion de oficina y retorne si dicho codigo esta en el vector.
   En el caso de encontrarlo se debe informar el DNI del propietario y en caso contrario informar que el codigo buscado no existe.

D) Indique a un modulo recursivo que recibe un valor de expensa y devuelve una lista enlazada con los codigos de oficina cuyo valor de expensa es superior al valor recibido.}


Program ParcialVectores;
const
  dimF=300;
type
  oficina=record
    codigo: integer;
    dni: integer;
    valor: real;
  end;
  vector=array[1..dimF] of oficina;
  indice=1..dimf;

  Listacod=^nodo;
  nodo=record
    datos:integer;
    sig:listacod;
  end;

Procedure LeerRegistro(var r:oficina);
begin
  write('Ingrese codigo de oficina: ');
  readln(r.codigo);
  if(r.codigo<>-1) then begin
    write('Ingrese DNI del propietario: ');
    readln(r.dni);
    write('Ingrese valor de expensa: ');
    readln(r.valor);
  end;
  writeln;
end;

Procedure CrearVector(var v:vector; var dimL:integer);
var
  r:oficina;
begin
  LeerRegistro(r);
  while(r.codigo<>-1) and (dimL<dimF) do begin
    diml:=diml+1;
    V[dimL]:=r;
    LeerRegistro(r);
  end;
end;

Procedure ImprimirVector(v:vector; diml:integer);
var
  i:integer;
begin
  for i:=1 to dimL do begin
    writeln('Codigo de identificacion: ', V[i].codigo);
    writeln('Dni: ',v[i].dni);
    writeln('Valor de expensa: ', V[i].valor);
    writeln;
  end;
end;

Procedure OrdenarPorInsercion(var v:vector; diml:integer);
var
  i,j:integer;
  dato:oficina;
begin
  for i:=2 to dimL do begin
    dato:=V[i];
    J:=i-1;
    while(J>0) and (V[J].codigo>dato.codigo) do begin
      V[J+1]:=V[J];
      J:=J-1;
    end;
    V[J+1]:=dato;
  end;
end;

Procedure BusquedaDicotomica(v:vector; ini,fin:indice;dato:real;var pos:indice);
var
  medio:indice;
begin
  medio:=ini+(fin-ini) div 2;
  if(ini=fin) and (V[medio].codigo<>dato) then
    writeln('No se encontro el codigo de identificacion de oficina')
  else begin
    if(V[medio].codigo=dato) then begin
      pos:=medio;
      writeln('Se encontro y el DNI del propietario es: ', V[pos].dni)
    end
    else begin
      if(V[medio].codigo>dato) then
        BusquedaDicotomica(v,ini,(medio-1),dato,pos)
      else
        BusquedaDicotomica(v,(medio+1),fin, dato,pos);
    end;
  end;
end;

Procedure AgregarAdelante(Dato:oficina;var L:listacod);
var
  nue:listacod;
begin
  new(nue);
  nue^.datos:=Dato.codigo;
  nue^.sig:=L;
  L:=nue;
end;

Procedure AgregarEnListaRecursivo(valor:real; var l:listaCod; v:vector; diml:integer);
begin
  if(diml<dimf) then begin
    if(V[diml].valor>valor) then
      AgregarAdelante(V[diml],L);
    dimL:=dimL+1;
    AgregarEnListaRecursivo(valor,l,v,diml);
  end;
end;

Procedure ImprimirLista(l:listacod);
begin
  while(l<>nil) do begin
    Write(L^.datos, ' ');
    L:=l^.sig;
  end;
end;

var
  l:listacod;
  v:vector;
  diml:integer;
  valor:real;
  pos:indice;
begin
  l:=nil;
  Diml:=0;
  CrearVector(v,diml);
  writeln('El vector generado con los datos es: ');
  ImprimirVector(v,diml);
  writeln;
  writeln('El vector ordenado por codigo de identificacion de oficina es: ');
  OrdenarPorInsercion(v,diml);
  ImprimirVector(v,diml);
  write('Ingrese un codigo de identificacion de oficina: ');
  readln(valor);
  BusquedaDicotomica(v,1,diml,valor,pos);
  write('Ingrese un valor de expensa: ');
  readln(valor);
  diml:=1;                                        {Importante no olvidar poner la diml en 1}
  AgregarEnListaRecursivo(valor,l,v,diml);
  write('Lista con los codigos de oficina cuyo valor de expensa es superior al valor recibido: ');
  ImprimirLista(l);
  readln;
end.
