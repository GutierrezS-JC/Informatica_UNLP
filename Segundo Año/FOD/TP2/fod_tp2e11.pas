program fodtp2e11;

const
  valor_alto = -1;

type
  registroM = record
    numu: integer;
    nomu: string;
    nom: string;
    ape: string;
    cant: integer;
  end;
  registroD = record
    numu: integer;
    dest: string;
    cmej: string;
  end;
  maestro = file of registroM;
  detalle = file of registroD;

procedure leer (var a: detalle; var r:registroD );
begin
  if (not eof(a)) then read(a,r) else r.numu:= valor_alto;
end;

procedure actualizar (var m: maestro; var d: detalle);
var rm: registroM; rd: registroD; ccnumu, cont: integer;
begin
  reset(m); reset(d);
  read(m,rm); leer(d,rd);
  while (rd.numu <> valor_alto) do begin
    while (rm.numu <> rd.numu) do read(m,rm);
    ccnumu:= rd.numu; cont:= 0;
    while (rd.numu = ccnumu) do begin
      cont:= cont + 1;
      leer(d,rd);
    end;
    rm.cant:= rm.cant + cont;
    seek(m,filepos(m)-1); write(m,rm);
  end;
  close(m); close(d);
end;

procedure informar (var d: detalle);
var rd: registroD; txt: Text; ccnumu, cont: integer;
begin
  assign(txt,'informe.txt');
  rewrite(txt); reset(d);
  leer(d,rd);
  while (rd.numu <> valor_alto) do begin
    ccnumu:= rd.numu; cont:= 0;
    while (rd.numu = ccnumu) do begin
      cont:= cont + 1; leer(d,rd);
    end;
    writeln(txt,ccnumu,' ',cont);
  end;
  close(txt); close(d);
end;

var mae: maestro; det: detalle;
begin
  assign(mae,'var/log/logmail.dat');
  assign(det,'diaX.det'); actualizar(mae,det);
  assign(det,'diaY.det'); informar(det);
  write('Programa termino...'); readln();
end.