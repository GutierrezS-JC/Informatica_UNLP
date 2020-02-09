program fodtp2e10;
const
  valor_alto = -1;
type
  registro = record
    anio, mes, dia, idu, tmp: integer;
  end;
  archivo = file of registro;

procedure leer (var a: archivo; var r: registro);
begin
  if (not eof(a)) then read(a,r) else r.anio:= valor_alto;
end;

procedure informar (var a: archivo; var ccanio: integer);
var r: registro; ccmes,ccdia,ccidu: integer;
  totalidu, totaldia, totalmes, totalanio: integer;
begin
  reset(a);
  leer(a,r);
  while (r.anio <> valor_alto) and (r.anio <> ccanio) do leer(a,r);
  if (r.anio = ccanio) then begin
    writeln('Año: ',ccanio);
    while (r.anio = ccanio) do begin
      ccmes:= r.mes;
      writeln('  Mes: ',ccmes);
      while (r.anio = ccanio) and (r.mes = ccmes) do begin
        ccdia:= r.dia; totaldia:= 0;
        writeln('    Dia: ',ccdia);
        while (r.anio = ccanio) and (r.mes = ccmes) and (r.dia = ccdia) do begin
          ccidu:= r.idu; totalidu:= 0;
          while (r.anio = ccanio) and (r.mes = ccmes) and (r.dia = ccdia) and (r.idu = ccidu) do begin
            totalidu:= totalidu + r.tmp; leer(a,r);
          end;
          writeln('      idUsuario ',ccidu, '  Total tiempo: ', totalidu);
          totaldia:= totaldia + totalidu;
        end;
        writeln('    Total tiempo del dia ',ccdia,': ',totaldia);
        totalmes:= totalmes + totaldia;
      end;
      writeln('  Total tiempo del mes ',ccmes,': ',totalmes);
      totalanio:= totalanio + totalmes;
    end;
    writeln('Total tiempo del año ',ccanio,': ',totalanio); end
  else begin
    writeln('Año no encontrado.');
  end;  
  close(a);
end;

var arch: archivo; anio: integer;
begin
  assign(arch,'fodtp2e10.mae');
  write('Ingrese el año (<=0: terminar): '); readln(anio);
  if (anio > 0) then informar(arch,anio);
  write('Programa termino...'); readln();
end.