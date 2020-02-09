(*Windows Free Pascal is developed by dr J.Szymanda under the GPL License*)
(*************************************************************************)
program tp2e1;

const valoralto = -1;

type
  alumno = record
    cod: integer;
    ape: string;
    nom: string;
    asf: integer;
    acf: integer;
  end;
  cursada = record
    cod: integer;           //codigo de alumno
    cf: integer;            //False=aprobo cursada, True=aprobo final
  end;       
  maestro = file of alumno;
  detalle = file of cursada;

procedure leerCursada (var arch: detalle; var cur: cursada);
begin
  if (not eof(arch)) then read (arch,cur) else cur.cod := valoralto;
end;

procedure crearMaestro (var mae: maestro);
var txt: Text; alu: alumno;
begin
  assign(txt, 'alumnos.txt');
  reset(txt); rewrite(mae);
  while (not eof(txt)) do begin
    with alu do begin readln(txt, cod, asf, acf, ape); readln(txt, nom); end;
    write(mae, alu); 
  end;
  close(txt); close(mae);
end;

procedure crearDetalle (var det: detalle);
var txt: Text; cur: cursada;
begin
  assign(txt, 'detalle.txt');
  reset(txt); rewrite(det);
  while (not eof(txt)) do begin
    readln(txt, cur.cod, cur.cf); 
    write(det, cur); 
  end;
  close(txt); close(det);
end;

procedure reporteAlumnos (var mae: maestro);
var txt: Text; alu: alumno;
begin
  assign(txt, 'reporteAlumnos.txt');
  rewrite(txt); reset(mae);
  while (not eof(mae)) do begin
    read(mae, alu);
    write(txt, 'Codigo de alumno: ', alu.cod, ' Apellido: ', alu.ape, ' Nombre: ', alu.cod, ' Cursadas aprobadas sin final: ', alu.asf, ' Cursadas aprobadas con final: ', alu.acf);
  end;
  close(txt); close(mae);
end;

procedure reporteDetalle (var det: detalle);
var txt: Text; cur: cursada; estado: string;
begin
  assign(txt, 'reporteDetalle.txt');
  rewrite(txt); reset(det);
  while (not eof(det)) do begin
    read(det, cur);
    if (cur.cf = 0) then estado:= ' sin final.' else estado:= ' con final.';
    write(txt, 'Codigo de alumno: ', cur.cod, ' Cursada: Aprobada ', estado);
  end;
  close(txt); close(det);
end;

procedure actualizarMaestro (var mae: maestro; var det: detalle);
var alu: alumno; cur: cursada;
begin
  reset(mae); reset(det);
  leerCursada(det, cur);
  while (cur.cod <> valoralto) do begin
    read(mae, alu);
    while (alu.cod <> cur.cod) do read(mae, alu);
    while (alu.cod = cur.cod) do begin
      if (cur.cf = 0) then alu.asf:= alu.asf + 1 else alu.acf:= alu.acf + 1;
      leerCursada(det, cur); 
    end;
    seek(mae,filepos(mae)-1); write(mae,alu);
  end;
  close(mae); close(det);
end;

procedure litsarAlumnos4cursadas (var mae: maestro);
var alu: alumno; cant: integer; txt: Text;
begin
  writeln('Lista de alumnos con mas de 4 cursadas aprobadas sin final:');
  reset(mae);
  while (not eof(mae)) do begin
    read(mae, alu);
    if ((alu.asf > 4) and (alu.acf = 0)) then
      with alu do writeln('Codigo: ', cod, ' Apellido: ', ape, ' Nombre: ', nom, ' Sin final: ', asf, ' Con Final: ', acf);
  end;
end;


var mae: maestro; det: detalle; menu: integer;
begin
  assign(mae,'tp2e2.mae');
  assign(det,'tp2e2.det');
  repeat
    writeln('-------------------------------------------------------');
    writeln('1. Crear archivo maestro desde alumnos.txt');
    writeln('2. Crear archivo detalle desde detalle.txt');
    writeln('3. Crear archivo reporteAlumnos.txt desde archivo maestro');
    writeln('4. Crear archivo reporteDetalles.txt desde archivo detalle');
    writeln('5. Actualizar archivo maestro desde archivo detalle');
    writeln('6. listar en archivo de texto alumnos con 4 cursadas aprobadas sin final');
    writeln('0. Salir');
    write('Opcion: '); readln(menu);
    case menu of
      1: crearMaestro(mae);
      2: crearDetalle(det);
      3: reporteAlumnos(mae);
      4: reporteDetalle(det);
      5: actualizarMaestro(mae, det);
      6: litsarAlumnos4cursadas(mae);
      else writeln('Opcion no valida');
    end;
  until (menu = 0);
  writeln('Programa termino...');
  readln();
end. 