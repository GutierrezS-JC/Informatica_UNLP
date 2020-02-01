Program ModulosGenericos;

{Listas}

Procedure AgregarAdelante(var l:lista; dato:integer); {Dato de tipo registro,integer etc}
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=L;
  L:=nue;
end;

Procedure AgregarAlFinal(var pri:lista; dato:integer) {Dato puede ser registro, integer, etc}
var
  nue:lista;
  act:lista;
begin
  new(nue);
  nue^.datos:=dato;
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

Procedure Insertar(var pri:lista; dato:integer);   {Dato puede ser un registro, ejemplo r:empleados}
var
  ant,nue,act:lista;
begin
  new(nue);
  nue^.datos:=dato;    {Puede ser un registro}
  act:=pri;
  ant:=pri;
  while(act<>nil) and (act^.datos<dato) do begin              {act^.datos.cod<.codigo}
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    pri:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;
end;

Procedure CrearLista(var l:lista); {CargarLista}
var
  n:integer;
begin
  n:=random(50);  {LeerRegistro}
  while(n<>0) do begin
    Insertar(l,n);     {L puede ser V[i]}
    n:=random(50);   {LeerRegistro}
  end;
end;

Procedure Imprimir(l:lista);    {Imprimir(V[i]}
begin
  write('La lista generada es: ');
  while(l<>nil) do begin
    write(l^.datos, ' ');
    L:=L^.sig;
  end;
end;

Procedure DeterminarMinimo(var v:vector; var min:integer);
var
  i;ListaMin:integer;
  aux:lista;
Begin
  min:=999;
  for i:=1 to dimF do
    if(V[i]<>nil) and (V[i]^.datos.cod<min) then begin
      min:=V[i]^.datos.cod;
      ListaMin:=i;
    end;
  if(min<>999) then begin
    aux:=V[ListaMin]^.sig;
    dispose(V[ListaMin]);
    V[ListaMin]:=aux;
  end;
end;

Procedure Merge4(v:vector; var L2:lista);
var
  min:integer;
begin
  DeterminarMinimo(v,min);
  while(min<>999) do begin
    AgregarAlFinal(L2,min);
    DeterminarMinimo(v,min);
  end;
end;

Procedure DeterminarMinimo(var v:vector; var C1:Consumo);      {Este es del merge, revisar programa para invocacion}
var
  i,ListaMin:integer;
  aux:lista;
begin
  C1.tipo:=999;
  for i:=1 to dimF do
    if(V[i]<>nil) and (V[i]^.datos.tipo<c1.tipo) then begin
      C1:=v[i]^.datos;
      ListaMin:=i;
    end;
  if(c1.tipo<>999) then begin       {antes usamos zzz cuando el tipo era cadena}
    aux:=V[ListaMin]^.sig;
    dispose(V[ListaMin]);
    V[ListaMin]:=aux;
  end;
end;

Procedure MergeAcumulador(var v:vector; var pri:Lista2);
var
  C1:Consumo;
  C2:Consumo2;
begin
  {C2.tipo:=999;}
  C2.monto:=0;
  DeterminarMinimo(v,C1);
  while(C1.tipo<>999) do begin
    C2.tipo:= C1.tipo; {Guarda el consumo actual como minimo}
    while(C1.tipo=C2.tipo) do begin
      C2.monto:=C2.monto + C1.monto;
      DeterminarMinimo(v,C1);
    end;
    AgregarAtras(pri,c2);
    C2.monto:=0;
  end;
end;

Procedure InsertarLista(var l:listaP; num:integer);  {agregar, no repetido}   {Agregar codigo de todas las pizzas solicitadas por el cliente sin repeticion}
var
  aux,nue:listaP;
begin
  aux:=l;
  while(aux <> nil)and(aux^.dato <> num) do
    aux:= aux^.sig;
  if(aux = nil)then begin
    new(nue);
    nue^.dato := num;
    nue^.sig:=l;
    l:=nue;
  end;
end;

{----------------------------------------------------------------------------------}
                        {Operacion en vectores}

Procedure InicializarVector(var v:vector);         {Siempre va acompañado del crearVector4listas}
var
  i:integer;
begin
  for i:=1 to dimF do
    V[i]:=nil;            {en NIL porque es una lista}
end;

Procedure CrearListaOrdenada(var v:vector; i:integer);        {Cargar Lista, usada para el merge}
var
  r:libros;
begin
  r.isbn:=random(11);
  while(r.isbn<>0) do begin
    Insertar(V[i],r);        {Usamos el modulo para insertar en una lista, ya que es un vector de listas, V[i] representa a una lista}
    r.isbn:=random(11);       {un campo del registro}
  end;
  write('La lista generada es la siguiente: ');
  ImprimirLista(V[i]);
  writeln;
end;

Procedure CrearVector4Listas(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimF do
    CrearListaOrdenada(V,i)     {CargarLista} {Se manda "i" para usar en otros modulos}
end;

Procedure AgregarEnListaRecursivo(valor:real; var l:listaCod; v:vector; diml:integer);
begin
  if(diml<dimf) then begin
    if(V[diml].valor>valor) then
      AgregarAdelante(V[diml],L);
    dimL:=dimL+1;                                   {Importante no olvidar poner la dimL en 1}
    AgregarEnListaRecursivo(valor,l,v,diml);
  end;
end;

Procedure CargarVector(var v:vector; var dimL);
var
  n:integer;
begin
  dimL:=0;
  n:=random(10);
  while(dimL<dimF) and (n<>0) do begin  {Usa un valor de corte, por eso verifica tambien la dimL<dimf} {Si quiero usar todo el vector uso un for i:=1 to dimF}
    dimL:=dimL+1;
    V[dimL]:=n;      {se agrega el dato, del tipo que sea}
    n:=random(10);
  end;
end;

Procedure ImprimirVector(var v:vector; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do
    write('-----');
  writeln;
  write(' ');
  for i:=1 to dimL do begin
    if(V[i]<10) then
      write('0');
    write(V[i],' | ');
  end;
  writeln;
  for i:=1 to dimL do
    write('-----');
  writeln;
  writeln;
end;

Procedure OrdenacionPorInsercion(var v:vector; dimL:integer);
var
  i,j,dato:integer;
begin
  for i:=2 to dimL do begin
    dato:=V[i];
    J:=i-1;
    while(j>0) and (V[J]>dato) do begin       {(V[J].codigo>dato.codigo)}
      V[J+1]:=V[J];
      J:=J-1;
    end;
    V[J+1]:=dato;
  end;
end;

Procedure BusquedaDicotomica(v:vector;ini,fin:indice; dato:integer;var pos:indice);  {El llamado es BusquedaDicotomica(v,1,dimL,dato,pos}
var
  medio:indice; {1..dimf}
begin
  medio:=ini+(fin-ini) div 2;
  if(ini=fin) and (V[medio]<>dato) then
    writeln('No se encontro el valor')
  else begin
    if(V[medio]=dato) then
      pos:=medio
    else begin
      if(V[medio]>dato) then
        BusquedaDicotomica(v,ini,(medio-1),dato,pos)
      else
        BusquedaDicotomica(v,(medio+1),fin,dato,pos);
    end;
  end;
end;

{write('Ingrese un numero a buscar en el vector: ');
 readln(num);
 BusquedaDicotomica(v,1,dimL,dato,pos)
 if (pos<>0)then
   writeln('El numero se encuentra en la posicion: ',pos);             {Pos es de tipo indice
 readln;}


{---------------------------------------------------------------------------------------}
                                {Modulos Recursion}

Function Potencia(base,exponente:integer):real;
begin
  if(exponente=0) then
    potencia:=1
  else
    potencia:= base*potencia(base,exponente-1);
end;

Procedure DigitoMaximo(num:integer; var max:integer) {El max se pasa por principal en -1} {Busca el digitoMaximo en un numero}
var
  dig:integer;
begin
  if(num<>0) then begin
    dig:=num mod 10;
    if(dig>max) then
      max:=dig;
    num:=num div 10;
    DigitoMaximo(num,max);
  end;
end;

Procedure ImprimirDigitos1(num:integer); {Imprime empezando por la unidad, es decir, al reves}
var
  dig:integer;
begin
  if(num<>0) then begin
    dig:=num mod 10;
    write(dig);
    Imprimirdigito1(num div 10);
  end;
end;

Procedure ImprimirDigitos2(num:integer); {Imprime finalizando con la unidad, es decir, en orden}
var
  dig:integer;
begin
  if(num<>0) then begin
    dig:=num mod 10;
    ImprimirDigitos2(num div 10);
    write(dig);
  end;
end;

Procedure ImprimirEnOrden(L:lista); {Imprime en el orden en que se guardaron}
var
  dig:integer;
begin
  if(l<>nil) then begin
    dig:=l^datos;
    writeln(dig);
    ImprimirEnOrden(l^.sig);
  end;
end;

Procedure ImprimirOrdenInverso(L:lista) {Imprime desde el ultimo dato guardado hasta el primero}
var
  dig:integer;
begin
  if(L<>nil) then begin
    dig:=L^.datos;
    ImprimirOrdenInverso(L^.sig);
    writeln(dig);
  end;
end;

Function Mayor(num1:integer; num2:integer):integer; {Devuelve el numero mas grande entre dos parametros}
begin
  if(num1>num2)then
    Mayor:=num1
  else
    Mayor:=num2;
end;

Function Maximo(L:lista):integer; {Devuelve el mayor numero de la lista}
begin
  if(l<>nil) then
    maximo:=0
  else
    Maximo:=Mayor(L^.datos,Maximo(L^.sig));
end;

Function Menor(num1:integer; num2:integer):integer; {Devuelve el numero mas chico entre dos parametros}
begin
  if(num1>num2) then
    Menor:=num1
  else
    Menor:=num2;
end;

Function minimo(l:lista):integer;            {Devuelve el valor minimo de la lista}
begin
  if(l=nil) then
    Minimo:=999
  else
    Minimo:=Menor(L^.datos,Minimo(L^.sig));
end;

Function Buscar(L:lista; num:integer): boolean;  {Retorna un valor booleano que indica si el dato esta o no en la lista}
begin
 if(l=nil) then
   Buscaar:=False
 else
   if(num=L^.datos) then
     Buscar:=true
   else
     if(num<>L^.datos) then             {Esta linea se puede omitir}
       Buscar:=Buscar(L^.sig,num);
end;

Function Maximo(v:vector; dimL:indice):integer; { type indice= 1..dimF} {Calcula el numero mas grande del vector}
begin
  if(dimL=0) then
    Maximo:=0
  else
    Maximo:=Mayor(V[dimL],Maximo(V,(DimL-1)));
end;

Function Suma(V:vector; dimL:indice): integer; {Suma todos los elementos del vector}
begin
  if(dimL=0) then
    suma:=0
  else
    suma:=V[dimL]+suma(v,(dimL-1));
end;

{----------------------------------------------------------------------------------------------}
                              {Modulos Arboles}

Procedure CargarArbol(var a:arbol; L:lista);     {Cuando se usa una lista y se la carga al arbol}
begin
  while(l<>nil) do begin
    InsertarEnArbol(a,l);      {Insertar o Insertar sin repetidos} {Se puede mandar l^.datos en vez de L}
    L:=L^.sig;
  end;
end;

Procedure CargarArbol(var a:arbol);    {Cuando se carga directamente al arbol} {Mejor usar este}
var
  r:Productos;
begin
  LeerRegistro(r);
  while(r.tipo<>'zzz') do begin
    Insertar(a,r); {en arbol}
    LeerRegistro(r);
  end;
end;

Procedure Insertar (var a:arbol; num:integer); {Insertar con repetidos} {el dato num puede ser de tipo lista o registro etc}
begin
  if(a=nil) then begin
    new(a);
    a^.info:=num; {o L^.datos}  {o R}
    a^.hi:=nil;
    a^.hd:=nil;
  end
  else
    if(num<a^.info)then
      Insertar(a^.hi,num)
    else
      Insertar(a^.hd,num);
end;

Procedure InsertarSinRepetidos(var a:arbol; num:integer);
begin
  if(a=nil) then begin
    new(a);
    a^.info:=num; {o L^.datos}  {o R}
    a^.hi:=nil;
    a^.hd:=nil;
  end
  else
    if(num<a^.info)then
      InsertarSinRepetidos(a^.hi,num)
    else
      if(a^.info<num) then
        InsertarSinRepetidos(a^.hd,num);
end;

Procedure preOrden(a:Arbol); {Recorre todo el arbol e imprime primero la raiz}
begin
  if(a<>nil) then begin
    write(a^.info,' ');
    PreOrden(a^.hi);
    PreOrden(a^.hd);
  end;
end;

Procedure PostOrden(a:arbol); {Imprime por ultimo la raiz}
begin
  if(a<>nil)then begin
    postOrden(a^.hi);
    postOrden(a^.hd);
    write(a^.info, ' ');
  end;
end;

Procedure enOrden(a:arbol); {Imprime de menor a mayor}
begin
  if(a<>nil) then begin
    enOrden(a^.hi);
    write(a^.info, ' ');
    enOrden(a^.hd);
  end;
end;

Function Buscar(a:arbol;dato:integer):boolean;   {Retorna un booleano que indica si el dato esta o no en el arbol}
begin
  if(a=nil) then
    Buscar:=false
  else
    if(dato:=a^.info) then
      Buscar:=true
    else
      if(dato<a^.info) then
        Buscar:=Buscar(a^.hi,dato)
      else
        Buscar:=Buscar(a^.hd,dato);
end;

Function Buscar(a:arbol;dato:integer):arbol; {Retorna la direcion del nodo en el arbol que tiene el valor buscado o nil si no existe} {Para invocacion revisar hoja}
begin
  if(a=nil) then
    Buscar:=nil
  else
    if(dato:=a^.info) then
      Buscar:=a;
    else
      if(dato<a^.info) then
        Buscar:=Buscar(a^.hi,dato)
      else
        Buscar:=Buscar(a^.hd,dato);
end;

Function verMin(a:arbol):arbol;        {Recibe un arbol y devuelve el valor minimo}  {Para invocacion revisar hoja}
begin
  if(a=nil) then
    verMin:=nil
  else
    if(a^.hi=nil) then
      verMin:=a
    else
      verMin:=verMin(a^.hi);
end;

Function verMax(a:arbol):arbol;         {recibe un arbol y devuelve el valor maximo} {Para invocacion revisar hoja}
begin
  if(a<>nil)then
    while(a^.hd<>nil)do
      a:=a^.hd;
  verMax:=a;
end;

Procedure RecorridoAcotado(a:arbol; inf,sup:integer); {Ver Valores en rango} {Inf y sup pueden ser valores explicitos y no ser pasados por parametro}
begin
  if(a<>nil) then begin
    if(a^.info>=inf) then begin
      if(a^.info<=sup)then begin
        write(a^.info, ' ');
        RecorridoAcotado(a^.hi,inf,sup);
        RecorridoAcotado(a^.hd,inf,sup)
      end else
        RecorridoAcotado(a^.hi,inf,sup)
    end else
      RecorridoAcotado(a^.hd,inf,sup);
  end;
end;

