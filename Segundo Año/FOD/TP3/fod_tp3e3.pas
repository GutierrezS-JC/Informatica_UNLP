(*Windows Free Pascal is developed by dr J.Szymanda under the GPL License*)
(*************************************************************************)
program fodtp3e3;

type
  registro = record
    cod: integer;
    gen,nom: string;
    dur: integer;
    dir: string;
    pre: real;
  end;
  archivo = file of registro;

function novelaPos (var a: archivo; cod: integer): integer;
var r: registro; ok: boolean;
begin
  ok:= false;
  //reset(a);
  while (not eof(a)) and (not ok) do begin
    read(a,r); ok:= (r.cod = cod);
  end;
  if ok then novelaPos:= (filepos(a)-1) else novelaPos:= -1;
  //close(a); 
end;

procedure leerRegistro (var r: registro);
begin
  write('Codigo (<=0: terminar): '); readln(r.cod); if (r.cod > 0) then begin
  write('Genero  : '); readln(r.gen);
  write('Nombre  : '); readln(r.nom);
  write('Duracion: '); readln(r.dur);
  write('Director: '); readln(r.dir);
  write('Precio  : '); readln(r.pre); end;
end;

procedure crearMaestro (var a: archivo);
var r: registro;
begin
  rewrite(a);
  r.cod:= 0; write(a,r);
  leerRegistro(r);
  while (r.cod > 0) do begin
    write(a,r); leerRegistro(r);
  end;
  close(a);
end;

procedure novelaAdd (var a: archivo);
var c,r: registro;
begin
  leerRegistro(r);
  if (r.cod > 0) then begin
    reset(a); read(a,c); //cabecera
    if (c.cod < 0) then begin
      seek(a,(c.cod * -1)); read(a,c);
      seek(a,filepos(a)-1); write(a,r);
      seek(a,0); write(a,c);
      writeln('---Novela agregada---'); end
    else begin 
      seek(a,filesize(a)); write(a,r);
    end;
    close(a);
  end;
end;

procedure novelaMod (var a: archivo);
var r: registro; pos: integer;
begin
  write('Codigo de novela a modificar (<=0:Cancelar): '); readln(r.cod);
  if (r.cod > 0) then begin
    reset(a); pos:= novelaPos(a,r.cod);
    if (pos >= 0) then begin
      writeln('---Datos actuales---');
      writeln('Codigo  : ',r.cod);
      writeln('Genero  : ',r.gen);
      writeln('Nombre  : ',r.nom);
      writeln('Duracion: ',r.dur);
      writeln('Director: ',r.dir);
      writeln('Precio  : ',r.pre);
      writeln('---Datos nuevos---');
      write('Genero  : '); readln(r.gen);
      write('Nombre  : '); readln(r.nom);
      write('Duracion: '); readln(r.dur);
      write('Director: '); readln(r.dir);
      write('Precio  : '); readln(r.pre);
      seek(a,pos); write(a,r); 
      writeln('---Modificacion guardada---'); end
    else begin
      writeln('Novela codigo ',r.cod,' no se encontro.');
    end;
    close(a);
  end;
end;

procedure novelaDel (var a: archivo);
var c,r: registro; pos: integer;
begin
  write('Codigo de novela a eliminar (<=0:Cancelar): '); readln(r.cod);
  if (r.cod > 0) then begin
    reset(a); read(a,c); pos:= novelaPos(a,r.cod);
    if (pos >= 0) then begin
      seek(a,pos); write(a,c);
      c.cod:= (pos * -1);
      seek(a,0); write(a,c);
      writeln('---Novela eliminada---'); end
    else begin
      writeln('Novela codigo ',r.cod,' no se encontro.');
    end;
    close(a);
  end;
end;

var a: archivo; opc: integer;
begin
  repeat
    writeln('-------------------------------------------------------');
    writeln('1. Crear archivo.');
    writeln('2. Agregar novela.');
    writeln('3. Modificar novela.');
    writeln('4. Eliminar novela.');
    writeln('0. Salir.');
    write('Opcion: '); readln(opc);
    case opc of
      1: crearMaestro(a);
      2: novelaAdd(a);
      3: novelaMod(a);
      4: novelaDel(a);
    end;
  until (opc = 0);
end.  
