program fodtp2e6;

const
  valor_alto = -1;

type
  cliente = record
    cod: integer;
    nom: string;
    ape: string;
  end;
  venta = record
    cli: cliente;
    anio: integer;
    mes: 1..12;
    dia: 1..31;
    mon: real;
  end;
  archivo = file of venta;

function nombreMes (n: integer): string;
var m: string;
begin
  case n of
    1: m:= 'Enero'; 
    2: m:= 'Febrero';
    3: m:= 'Marzo';
    4: m:= 'Abril';
    5: m:= 'Mayo';
    6: m:= 'Junio';
    7: m:= 'Julio';
    8: m:= 'Agosto';
    9: m:= 'Septiembre';
    10: m:= 'Octubre';
    11: m:= 'Noviembre';
    12: m:= 'Diciembre';
  end;
  nombreMes:= m;
end;

procedure leer (var a: archivo; var r: venta); begin
  if (not eof(a)) then read(a,r) else r.cli.cod:= valor_alto;
end;

procedure imprimirReporte (var mae: archivo);
var v: venta; ccod, vanio, vmes: integer; nombre, apellido: string; totalE, totalM, totalA: real;
begin
  reset(mae); totalE:= 0; totalA:= 0; totalM:= 0;
  writeln('----- Reporte de ventas -----');
  leer(mae,v);
  while (v.cli.cod <> valor_alto) do begin
    ccod:= v.cli.cod;
    writeln('Codigo de cliente: ', v.cli.cod, ', Nombre: ', v.cli.nom, ', Apellido: ', v.cli.ape);
    while (v.cli.cod = ccod) do begin
      vanio:= v.anio;
      writeln('  Año: ', v.anio);
      while (v.cli.cod = ccod) and (v.anio = vanio) do begin
        vmes:= v.mes;
        while (v.cli.cod = ccod) and (v.anio = vanio) and (v.mes = vmes) do begin
          totalM:= totalM + v.mon;
          leer(mae,v);
        end;
        writeln('    Mes: ', nombreMes(v.mes), ' Monto: ', totalM);
        totalA:= totalA + totalM; totalM:= 0;
      end;
      writeln('  Total año ', vanio, ': ', totalA);
      totalE:= totalE + totalA; totalA:= 0;
    end;
  end;
  writeln('Total monto de ventas: ', totalE);
  close(mae);
end;

var mae: archivo;
begin
  assign(mae, 'tp2e6.mae');
  writeln('Prpograma termino...'); readln();
end.
