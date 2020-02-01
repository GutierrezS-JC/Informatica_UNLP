program EjercitacionHoja;
type
  cadena=string[50];
  ventas=record                {Registro de la lista de ventas}
    codigoC:integer;
    codigoP:integer;
    monto:real;
  end;

  listaCod = ^nodoP;       {Lista cod de pizzas}
  nodoP= record
    dato: integer;
    sig:listaCod;
  end;



  registroCli=record             {Campo info del arbol}
    lisCod:listaCod;
    codigo:integer;
    monto:real;
  end;

  arbol=^nodoA;                {Arbol}
  nodoA=record
    info:registroCli;
    hi:arbol;
    hd:arbol;
  end;

Procedure LeerRegistro(var r:ventas);
begin
  write('Ingrese el monto: ');
  readln(R.monto);
  if(R.Monto<>0) then begin
    write('Ingrese codigo de cliente: ');
    readln(R.codigoC);
    write('Ingrese codigo de Pizza: ');
    readln(R.codigoP);
  end;
end;



Procedure agregarNoRepetido(var l:listaCod; cod:integer);  {agregar}
var
  aux,nuevo:listaCod;
begin
   aux:=l;

  while(aux <> nil)and(aux^.dato <> cod) do
        aux:= aux^.sig;

    if(aux = nil)then begin
      new(nuevo);
       nuevo^.dato := cod;
       nuevo^.sig:=l;
       l:=nuevo;

    end;
end;

Procedure Insertar(var a:arbol; reg:ventas);
begin
  if(a= nil) then begin
    new(a);
    a^.info.codigo:=reg.codigoC;
    a^.info.monto:= reg.monto;
    agregarNoRepetido(a^.info.lisCod, reg.codigoP);
    a^.hi:=nil;
    a^.hd:=nil;
  end else
    if(a^.info.codigo>reg.codigoC) then
      Insertar(a^.hi,reg)
    else
      if(a^.info.codigo<reg.CodigoC) then
        Insertar(a^.hd,reg)
      else begin
        agregarNoRepetido(a^.info.lisCod, reg.codigoP);
        a^.info.monto := a^.info.monto + reg.monto;
        end;
end;


Procedure CargarArbol(var a:arbol);
var
reg:ventas;
begin
         LeerRegistro(reg);
  while(reg.monto <> 0) do begin
    Insertar(a,reg);
    LeerRegistro(reg);
  end;
end;


procedure imprimir(a:arbol);
 begin
       if(a <> nil) then begin
          imprimir(a^.hi);
                write('  ',a^.info.codigo);
          imprimir(a^.hd);
       end;

 end;

     procedure puntoA(a:arbol; var cant:integer);
  begin
       if(a <> nil) then begin
          puntoA(a^.hi,cant);
                if(a^.info.monto >= 600)and (a^.info.monto <=1100)then
                     cant:=cant+1;
          puntoA(a^.hd,cant);
       end;

 end;

Procedure RecorridoAcotado(a:arbol);          {Punto 2}
begin
  if(a<>nil) then begin
    if(a^.info.codigo>=170)then begin
      if(a^.info.codigo<=300) then begin
        writeln('Para el Cod: ',a^.info.codigo);
        while(a^.info.lisCod <> nil) do begin
            write(a^.info.lisCod^.dato);
           a^.info.lisCod := a^.info.lisCod^.sig;
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
 CargarARBOL(a);
 Imprimir(a);
 puntoA(a,cant);
 writeln;writeln('La cantidad del punto A es:',cant);
 RecorridoAcotado(a);
 readln;

 end.



