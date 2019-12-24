(*Windows Free Pascal is developed by dr J.Szymanda under the GPL License*)
(*************************************************************************)
program fodtp2e12;

const
  valor_alto = -1;
type
  registro = record
    destino,fecha,hora: string;
    asien: integer;
  end;
  archivo = file of registro;

procedure leer(var a: archivo; var r: registro);
begin
  if (not eof(a)) then read(a,r) else r.asien := valor_alto;
end;

procedure minimo (var d1,d2: archivo; var r1,r2,m: registro);
var a: integer;
begin
  a:= 2;
  if (r1.destino < r2.destino) then
    a:= 1
  else
    if (r1.destino = r2.destino) and (r1.fecha < r2.fecha) then
      a:= 1
    else
      if (r1.destino = r2.destino) and (r1.fecha = r2.fecha) and (r1.hora <= r2.hora) then
        a:= 1;

  if (a = 1) then begin
    m:= r1; leer(d1,r1); end
  else begin
    m:= r2; leer(d2,r2);
  end;
end;

procedure actualizar (var am,d1,d2: archivo; listar: integer);
var rm,r1,r2,m: registro; ccdestino,ccfecha,cchora: string;
begin
  reset(am); reset(d1); reset(d2);
  read(am,rm); leer(d1,r1); leer(d2,r2);
  minimo(d1,d2,r1,r2,m);
  while (m.asien <> valor_alto) do begin
    ccdestino:= m.destino; ccfecha:= m.fecha; cchora:= m.hora;
    while (ccdestino = m.destino) and (ccfecha = m.fecha) and (cchora = m.hora) do begin
      rm.asien:= rm.asien - m.asien;
      minimo(d1,d2,r1,r2,m);
    end;
    seek(am,filepos(am)-1); write(am,rm);
    if (rm.asien < listar) then begin
      writeln('Destino: ',rm.destino,' Fecha: ',rm.fecha,' Hora: ',rm.hora,' Asientos: ',rm.asien);
    end;
    read(am,rm);
  end;
  close(am); close(d1); close(d2);
end;

var am,d1,d2: archivo; listar: integer;
begin
  assign(am,'tp2e12.mae'); assign(d1,'tp2e12-1.det'); assign(d2,'tp2e12-2.det');
  write('Vuelos con disponibilidad de asientos menor a: '); readln(listar);
  actualizar(am,d1,d2,listar);
  writeln('Programa termino...'); readln();
end.