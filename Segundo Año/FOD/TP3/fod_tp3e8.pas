program fodtp3e8;

Uses sysutils;

const
  valor_alto = -1;

type
  empleado = record    //<largo_registro><cod><dni><largo_ape><ape><largo_nom><nom>...
    cod: integer;
    dni: longint;
    ape, nom: string;
    peso, est: real;
    fdn: longint;
  end;
  archivo = file;

procedure leerEmpleado (var e: empleado);
begin
  write('Codigo (0=terminar): '); readln(e.cod);  if (e.cod <> 0) then begin
  write('DNI: '); readln(e.dni);
  write('Apellido: '); readln(e.ape);
  write('Nombre: '); readln(e.nom);
  write('Peso: '); readln(e.peso);
  write('Estatura: '); readln(e.est);
  write('Fecha de nacicmiento (longint, ej: 20190508): '); readln(e.fdn); end;
end;

function len (s: string):integer; begin len:= length(s); end;

procedure escribirEmpleado (var a: archivo; e: empleado);
var lenR, lenI: integer; lenB: byte;
begin
  lenI:= sizeof(lenI);
  lenB:= sizeof(lenB);
  with e do begin
    lenR:= sizeof(cod) + sizeof(dni) + lenI + length(trim(ape)) + lenI + length(trim(nom)) + sizeof(peso) + sizeof(est) + 1 + sizeof(fdn);
    blockwrite(a,lenR,lenI);
    blockwrite(a,cod,sizeof(cod));
    blockwrite(a,dni,sizeof(dni));
    blockwrite(a,len(ape),sizeof(lenI)); blockwrite(a,ape[1],length(trim(ape)));
    blockwrite(a,len(nom),sizeof(lenI)); blockwrite(a,nom[1],length(trim(nom)));
    blockwrite(a,peso,sizeof(peso));
    blockwrite(a,est,sizeof(est));
    lenB:= sizeof(fdn);
    blockwrite(a,lenB,sizeof(lenB)); blockwrite(a,fdn,sizeof(fdn));
  end;
end;

procedure guardarEmpleados (var a: archivo);
var e: empleado;
begin
  writeln('----- Carga de empleados -----');
  rewrite(a,1);
  leerEmpleado(e); writeln('-----');
  while (e.cod <> 0) do begin
    escribirEmpleado(a,e);
    leerEmpleado(e); writeln('-----');
  end;
  close(a);
  writeln('----- Fin carga de empleados -----');
end;

procedure leerRegistro (var a: archivo; var e: empleado);
var lenR, i: integer; lenB: byte; campos: array [1..1024] of byte;
begin
  if (not eof(a)) then begin
    blockread(a,lenR,sizeof(lenR));
    blockread(a,campos,lenR);
    i:= 1;
    with e do begin
      move(campos[i],cod,sizeof(cod)); i:= i + sizeof(cod);
      move(campos[i],dni,sizeof(dni)); i:= i + sizeof(dni);
      move(campos[i],lenR,sizeof(lenR)); i:= i + sizeof(lenR); setlength(ape,lenR); move(campos[i],ape[1],lenR); i:= i + lenR;
      move(campos[i],lenR,sizeof(lenR)); i:= i + sizeof(lenR); setlength(nom,lenR); move(campos[i],nom[1],lenR); i:= i + lenR;
      move(campos[i],peso,sizeof(peso)); i:= i + sizeof(peso);
      move(campos[i],dni,sizeof(est)); i:= i + sizeof(est);
      move(campos[i],lenB,sizeof(lenB)); i:= i + sizeof(lenB); move(campos[i],fdn,lenB);
    end; end
  else begin
    e.cod:= valor_alto;
  end;
end;

procedure imprimirRegistro (e: empleado); begin
  with e do begin
    writeln('Codigo: ',cod);
    writeln('DNI: ',dni);
    writeln('Apellido: ',trim(ape));
    writeln('Nombre: ',trim(nom));
    writeln('Peso: ',peso:0:2);
    writeln('Estatura: ',est:0:2);
    writeln('Fecha de hacimiento: ',fdn);
  end;
end;

procedure listarEmpleados(var a: archivo);
var e: empleado;
begin
  writeln('----- Lista de empleados -----');
  reset(a,1);
  leerRegistro(a,e);
  while (e.cod <> valor_alto) do begin
    imprimirRegistro(e); writeln('-----');
    leerRegistro(a,e);
  end;
  close(a);
  writeln('----- Fin lista -----');
end;

var a: archivo;
begin
  assign(a,'fodtp3e8.rlv');
  guardarEmpleados(a);
  listarEmpleados(a);
  writeln('Programa termino...'); readln();
end.
