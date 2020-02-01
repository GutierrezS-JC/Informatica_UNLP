{Una pizzeria tiene la informacion de las ventas telefonicas realizadas a sus clientes.
 De cada venta se conoce: codigo de cliente, codigo de pizza solicitada y monto a abonar por la pizza.

1) Lea la informacion de las ventas hasta ingresar una con monto 0.
   A partir de esta genere una estructura que almacene para cada codigo de cliente el total abonado por este entre todas las ventas y los codigos de todas las pizzas
   solicitadas por el (sin repeticion).
   La estructura debe estar ordenada por codigo de cliente y ser eficiente para la busqueda por dicho criterio.

A partir de la estructura generada en 1) realice modulos independientes para:

2) Informar la cantidad de clientes con un total abonado entre $600 y $1100.

3) Informar los codigos de pizza solicitados por los clientes cuyo codigo esta entre 170 y 300.

Nota: La informacion en 1) se lee sin orden alguno. }

Program ParcialPizzas;
type
  ventas=record              {Registro de la lista de ventas}
    codigo:integer;
    codigoPizza:integer;
    monto:real;
  end;
  listaP=^nodo;              {Lista codigo de pizzas}
  nodo=record
    datos:integer;
    sig:listaP;
  end;
  RegistroA=record              {Campo info del arbol}
    codigoCliente:integer;
    montoA: real;           {total abonado por codigo de cliente entre todas las ventas}
    codigoPizza:ListaP;  {Lista de todas las pizzas solicitadas}
  end;
  arbol=^nodoA;           {arbol}
  nodoA=record
    info: registroA;
    hi:arbol;
    hd:arbol;
  end;

Procedure InsertarLista(var l:listaP; num:integer);  {agregar, no repetido}   {Agregar codigo de todas las pizzas solicitadas por el cliente sin repeticion}
var
  aux,nue:listaP;
begin
  aux:=l;
  while(aux <> nil)and(aux^.datos <> num) do
    aux:= aux^.sig;
  if(aux = nil)then begin
    new(nue);
    nue^.datos := num;
    nue^.sig:=l;
    l:=nue;
  end;
end;

Procedure Insertar(var a:arbol; r:ventas);                        {Insertar en Arbol}
begin
  if(a= nil) then begin
    new(a);
    a^.info.codigoCliente:=r.codigo;
    a^.info.montoA:= r.monto;
    InsertarLista(a^.info.codigoPizza, r.codigoPizza);
    a^.hi:=nil;
    a^.hd:=nil;
  end else
    if(a^.info.codigoCliente>r.codigo) then
      Insertar(a^.hi,r)
    else
      if(a^.info.codigoCliente<r.Codigo) then
        Insertar(a^.hd,r)
      else begin
        InsertarLista(a^.info.codigoPizza, r.codigoPizza);
        a^.info.montoA := a^.info.montoA + r.monto;
        end;
end;

Procedure LeerRegistro(var r:ventas);
begin
  write('Ingrese el monto: ');
  readln(R.monto);
  if(R.Monto<>0) then begin
    write('Ingrese codigo de cliente: ');
    readln(R.codigo);
    write('Ingrese codigo de Pizza: ');
    readln(R.codigoPizza);
  end;
end;

Procedure CargarArbol(Var a:arbol);
var
  r:ventas;   {Informacion de ventas telefonicas}
begin
  LeerRegistro(r);
  while(r.monto<>0) do begin
    Insertar(a,r);
    LeerRegistro(r);
  end;
end;

Procedure Imprimir(a:arbol);
begin
  if(a <> nil) then begin
    imprimir(a^.hi);
    write(a^.info.codigoCliente, ' ');
    imprimir(a^.hd);
  end;
end;

Procedure puntoA(a:arbol; var cant:integer);        {Informe la cantidad de clientes con un total abonado entre 600 y 1100 pesos}
begin
  if(a <> nil) then begin
    puntoA(a^.hi,cant);
    if(a^.info.montoA >= 600)and (a^.info.montoA <=1100)then
      cant:=cant+1;
    puntoA(a^.hd,cant);
  end;
end;

Procedure RecorridoAcotado(a:arbol);          {Punto 3}   {Informar los codigos de pizza solicitados por los clientes cuyo codigo esta entre 170 y 300}
begin
  if(a<>nil) then begin
    if(a^.info.codigoCliente>=170)then begin
      if(a^.info.codigoCliente<=300) then begin
        writeln('Para el Cod: ',a^.info.codigoCliente);
        while(a^.info.codigoPizza <> nil) do begin
            write(a^.info.codigoPizza^.datos);
           a^.info.codigoPizza := a^.info.codigoPizza^.sig;
        end;
        RecorridoAcotado(a^.hi);
        RecorridoAcotado(a^.hd)
      end else
        RecorridoAcotado(a^.hi)
    end else
      RecorridoAcotado(a^.hd);
  end;
end;

var
  a:arbol;
  cant:integer;
begin
  a:=nil;
  cant:=0;
  CargarArbol(a);
  Imprimir(a);
  PuntoA(a,cant);
  writeln;
  writeln('La cantidad del puntoA es: ', cant);
  RecorridoAcotado(a);
  readln;
end.
