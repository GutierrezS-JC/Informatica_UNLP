(*Windows Free Pascal is developed by dr J.Szymanda under the GPL License*)
(*************************************************************************)
program tp1e5;

Uses sysutils;

type
  persona = record
    ape: string;
    nom: string;
    edad: integer;
    dni: integer;
  end;
  archivo = file of persona;

function nrr (var a: archivo; p: persona): integer;
var r: persona; ok: boolean;
begin
  ok:= false;
  reset(a);
  while (not eof(a)) and (not ok) do begin
    read(a,r); ok:= (r.dni = p.dni);
  end;
  close(a);
  if ok then nrr:= (filepos(a)-1) else nrr:= -1;
end;
  
procedure baja (var a: archivo; pos: integer);
var r: persona;
begin
  reset(a);
  seek(a,filesize(a)-1); read(a,r); seek(a,filepos(a)-1); truncate(a);
  seek(a,pos); write(a,r);
  close(a);
end;

procedure dardebaja (var a: archivo);
var p: persona; pos: integer;
begin
  write('DNI de la persona a dar de baja (<=0: cancelar): '); readln(p.dni);
  if (p.dni > 0) then begin
    pos:= nrr(a,p);
    if (pos > -1) then baja(a,pos) else writeln('No se encontro el DNI ',p.dni);
  end;
end;

procedure leerpersona(var p: persona); begin
  write('Apellido (en blanco=terimnar): '); readln(p.ape); if (p.ape <> '') then begin
  write('Nombre: '); readln(p.nom);
  write('Edad: '); readln(p.edad);
  write('DNI: '); readln(p.dni); end;
end;

procedure guardarpersona(var arch: archivo; add: integer);
var p: persona;
begin
  if (add = 0) then begin
    write('Ingrese el nombre del archivo (personas.reg por defecto): '); readln(p.nom);
    if (p.nom = '') then p.nom:= 'personas.reg';
    assign(arch,p.nom); rewrite(arch);
    p.nom:= '';
  end;
  leerpersona(p);
  while (p.ape <> '') do begin
    write(arch,p);
    leerpersona(p);
  end;
  close(arch);
  writeln('La carga de resgistros de personas termino.');
end;

procedure modificaredad(var arch: archivo);
var r, p: persona;
begin
  repeat
    write('Apellido (en blanco=terminar): '); readln(p.ape);
    write('Nombre (en blanco=terminar): '); readln(p.nom);
    write('Edad nueva: '); readln(p.edad);
    if (p.ape <> '') then begin
      reset(arch);
      read(arch,r);
      while ((not eof(arch)) and (r.ape <> p.ape) and (r.nom <> p.nom)) do begin
        read(arch,r);
      end;
      if ((r.ape = p.ape) and (r.nom = p.nom)) then begin
        r.edad:= p.edad;
        seek(arch,filepos(arch)-1);
        write(arch,r);
      end;
      close(arch);
    end;
    repeat
      write('¿Procesar otro registro? 0=No, 1=Si '); readln(r.edad);
    until ((r.edad = 0) or (r.edad = 1));
  until (r.edad = 0);
end;

procedure exportarTXT (var arch: archivo);
var a: string; p: persona; txt: file of string;
begin
  assign(txt,'personas.txt'); rewrite(txt);
  reset(arch);
  while (not eof(arch)) do begin
    read(arch,p);
    write(txt, p.ape, ' ', p.nom, ' ', inttostr(p.edad), ' ', inttostr(p.dni));
  end;
  close(txt);
  close(arch);
end;

procedure erroneosTXT (var arch: archivo);
var a: string; p: persona; txt: file of string;
begin
  assign(txt,'erroneos.txt'); rewrite(txt);
  reset(arch);
  while (not eof(arch)) do begin
    read(arch,p);
    if (p.dni = 0) then write(txt, p.ape, ' ', p.nom, ' ', inttostr(p.edad), ' ', inttostr(p.dni));
  end;
  close(txt);
  close(arch);
end;

procedure personalinea(p: persona); begin
  writeln('Apellido: ', p.ape, ' Nombre: ', p.nom, ' Edad: ', p.edad, ' DNI: ', p.dni);
end;

procedure mostrarapellido(var arch: archivo; ap: string);
var p: persona;
begin
  reset(arch); seek(arch,0);
  while (not eof(arch)) do begin
    read(arch,p);
    if (p.ape = ap) then personalinea(p);
  end;
  close(arch);
end;
procedure listaapellido(var arch: archivo);
var ap: string;
begin
  write('Ingrese el apellido (en blanco=terminar): '); readln(ap);
  if (ap <> '') then mostrarapellido(arch,ap);
end;

procedure listarT (var arch: archivo);
var p: persona;
begin
  reset(arch); seek(arch,0);
  while (not eof(arch)) do begin
    read(arch,p);
    personalinea(p);
  end;
  close(arch);
end;

procedure listar18 (var arch: archivo);
var p: persona;
begin
  reset(arch); seek(arch,0);
  while (not eof(arch)) do begin
    read(arch,p);
    if (p.edad > 18) then personalinea(p);
  end;
  close(arch);
end;
  
function menu(): integer;
var opcion: integer;
begin
  repeat
    writeln('Selecciones una opción escribiendo el numero que corresponde:');
    writeln('1. Crear archivo de resgistros de presonas.');
    writeln('2. Mostrar lista de personas que tengan un apellido indicado.');
    writeln('3. Mostrar lista de personas registradas.');
    writeln('4. Mostrar lista de personas mayores de 18 años.');
    writeln('5. Agregar personas al final del archivo.');
    writeln('6. Modificar edad de pesonas.');
    writeln('7. Exportar registros a personas.txt.');
    writeln('8. Exportar registros con DNI=0 a erroneos.txt.');
    writeln('9. Dar de baja un registro segun DNI.');
    writeln('0. Terminar.');
    write('Opcion: '); readln(opcion);
    writeln('-------------------------------------------------------------');
  until ((opcion >= 0) and (opcion <=4));
  menu:= opcion;                             
end;

var arch: archivo; opcion: integer;
begin                 
  writeln('-------------------------------------------------------------');
  repeat
    opcion:= menu();
    case opcion of
      1: guardarpersona(arch,0);
      2: listaapellido(arch);
      3: listarT(arch);
      4: listar18(arch);
      5: guardarpersona(arch,1);
      6: modificaredad(arch);
      7: exportarTXT(arch);
      8: erroneosTXT(arch);
    end;
  until (opcion = 0);
  //while (not eof(arch)) do begin
  //  read(arch,num);
  //  if ((num MOD 2) = 0) then mult:= mult + 1;
  //  if (num > 100000) then mayor:= mayor + 1;
  //end;
  //close(arch);
  //writeln('Cantidad de numeros multiplos de dos: ', mult);
  //writeln('Cantidad de numeros mayores a cien mil: ', mayor);  
  //writeln('Programa termino...'); readln();
end.
