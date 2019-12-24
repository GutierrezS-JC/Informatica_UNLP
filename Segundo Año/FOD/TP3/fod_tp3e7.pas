(*Windows Free Pascal is developed by dr J.Szymanda under the GPL License*)
(*************************************************************************)
program fodtp3e7;

type
  nombre = string;
  archivo = file;

function len (s: string): integer; begin len:= length(s); end;
procedure bwrite (var a: archivo; s: nombre); begin blockwrite (a,s[1],len(s)); end;

procedure ingresarNombre (var n: nombre); begin
  write('Nombre: '); readln(n);
end;

procedure guardarNombres (var a: archivo);
var n: nombre; sr: string; //c: integer;
begin
  rewrite(a,1);
  sr:= '@'; //c:= 0;
  writeln('----- Carga de nombres -----');
  ingresarNombre(n);
  while (n <> '') do begin
    blockwrite(a,n[1],length(n));
    blockwrite(a,sr[1],length(sr)); //c:= c + 1;
    ingresarNombre(n);
  end;
  //blockwrite(a,c,sizeof(c));
  writeln('----- Fin de carga -----');
  close(a);
end;

procedure listar (var a: archivo);
var n: nombre; sr, campo: string; buffer: char;
begin
  writeln('----- Listando contenido de archivo -----');
  sr:= '@';
  reset(a,1);
  while (not eof(a)) do begin
    blockread(a,buffer,1); campo:= '';
    while (buffer <> sr) and (not eof(a)) do begin
      campo:= campo + buffer;
      blockread(a,buffer,1);
    end;
    writeln('Nombre: ',campo);
  end;
  close(a);
  writeln('----- Fin contenido -----');
end;

var a: archivo;
begin
  assign(a, 'fodtp3e7.rlv');
  guardarNombres(a);
  listar(a);
  writeln('Programa termino...');
  readln();
end.