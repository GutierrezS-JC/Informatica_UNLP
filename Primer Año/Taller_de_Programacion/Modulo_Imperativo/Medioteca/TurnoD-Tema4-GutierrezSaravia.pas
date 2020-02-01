{Alumno:Juan Cruz Gutierrez Saravia}

Program Parcial;
const
  dimf=6;
type
  compra=record
    codigoLocal:1..6;
    numeroCompra:integer;
    codigoCliente:integer;
    DNI:integer;
    puntos:integer;
  end;
  Lista=^nodo;
  nodo=record
    datos:compra;
    sig:lista;
  end;
  RegistroA=record
    codigoCliente:integer;
    DNI:integer;
    puntos:integer;
  end;
  arbol=^nodoA;
  nodoA=record
    info:RegistroA;
    hi:arbol;
    hd:arbol;
  end;
  Vector=array[1..dimF] of Lista;

Procedure InicializarVector(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimF do
    V[i]:=nil;
end;

Procedure LeerRegistro(var r:compra);
begin
  write('Ingrese codigo de cliente: ');
  readln(r.codigoCliente);
  if(r.codigoCliente<>999) then begin
    write('Ingrese codigo de local: ');
    readln(r.codigoLocal);
    write('Ingrese numero de compra: ');
    readln(r.numeroCompra);
    write('Ingrese DNI: ');
    readln(r.dni);
    write('Ingrese puntos obtenidos: ');
    readln(r.puntos);
    writeln;
  end;
end;

Procedure Insertar(Var pri:lista;r:compra);
var
  ant,nue,act:lista;
begin
  new(nue);
  nue^.datos:=r;
  act:=pri;
  ant:=pri;
  while(act<>nil) and (act^.datos.codigoCliente<r.CodigoCliente) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

Procedure CrearListaOrdenada(var v:vector; i:integer);               {Cargar Lista}
var
  r:compra;
begin
  LeerRegistro(r);
  while(r.CodigoCliente<>999) do begin
    Insertar(V[i],r);
    LeerRegistro(r);
  end;
end;

Procedure CrearVector6Listas(var v:vector);
var
  i:integer;
begin
  for i:= 1 to dimF do
    CrearListaOrdenada(v,i)
end;

{Punto B}

Procedure InsertarEnArbol(var a:arbol; r:compra);
begin
  if(a=nil) then begin
    new(a);
    a^.info.codigoCliente:=r.codigoCliente;
    a^.info.dni:=r.dni;
    a^.info.puntos:=r.puntos;
    a^.hi:=nil;
    a^.hd:=nil;
  end
  else
    if(r.dni<a^.info.dni)then
      InsertarEnArbol(a^.hi,r)
    else
      if(a^.info.dni<r.dni) then
        InsertarEnArbol(a^.hd,r)
      else
        a^.info.puntos := a^.info.puntos+ r.puntos;
end;

Procedure CargarArbol(var a:arbol;V:vector);
var
  i:integer;
begin
  for i:=1 to dimF do begin
    while(V[i]<>nil) do begin
      InsertarEnArbol(a,V[i]^.datos);
      V[i]:=V[i]^.sig;
    end;
  end;
end;

{Punto C}

Procedure enOrden(a:arbol; var dniC:integer; var valor:integer);
begin
  if(a<>nil) then begin
    enOrden(a^.hi,dniC,valor);
    if(a^.info.puntos>valor) then
      dniC:=a^.info.dni;
      valor:=a^.info.puntos;
    enOrden(a^.hd,dniC,valor);
  end;
end;

var
  v:vector;
  a:arbol;
  valor:integer;
  dniC:integer;
begin
  a:=nil;
  InicializarVector(v);
  CrearVector6Listas(v);
  CargarArbol(a,v);
  valor:=-1;
  enOrden(a,dniC,valor);
  write('El DNI del cliente con mayor cantidad de puntos acumulados es: ', dniC);
  writeln;
  readln;
end.
