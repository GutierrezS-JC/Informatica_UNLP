(*Windows Free Pascal is developed by dr J.Szymanda under the GPL License*)
(*************************************************************************)
program fodtp2e4;

const
  valor_alto = 9999;

type
  registro = record
    cod: integer;
    fecha: string;
    total: integer;  //cantidad de segundos
  end;
  archivo = file of registro;
  arrDet = array[1..5] of archivo;
  arrReg = array[1..5] of registro;
  
procedure leer (var a: archivo; var r: registro); begin
  if (not eof(a)) then read(a,r) else r.cod:= valor_alto;
end;

procedure minimo (var arrD: arrDet; var arrR: arrReg; var m: registro);
var i,r: integer;
begin
  i:= 1; m:= arrR[i]; r:= 0;
  for i:= 2 to 5 do begin
    if (arrR[i].cod < m.cod) then begin
      m:= arrR[i]; r:= i;
    end;
  end;
  if (r > 0) then leer(arrD[r],arrR[r]);
end;

procedure generarMaestro (var arrD: arrDet);
var mae: archivo; arrR: arrReg; regm, min: registro;
begin
  assign(mae,'log');
  rewrite(mae);
  reset(arrD[1]); reset(arrD[2]); reset(arrD[3]); reset(arrD[4]); reset(arrD[5]);
  readln();
  leer(arrD[1],arrR[1]); leer(arrD[2],arrR[2]); leer(arrD[3],arrR[3]); leer(arrD[4],arrR[4]); leer(arrD[5],arrR[5]);
  minimo(arrD,arrR,min);
  while (min.cod <> valor_alto) do begin
    regm.cod:= min.cod;
    while (regm.cod = min.cod) do begin
      regm.fecha:= min.fecha; regm.total:= 0;
      while (regm.cod = min.cod) and (regm.fecha = min.fecha) do begin
        regm.total:=  regm.total + min.total;
        minimo(arrD,arrR,min);
      end;
      write(mae,regm);
    end;
  end;
  close(mae); close(arrD[1]); close(arrD[2]); close(arrD[3]); close(arrD[4]); close(arrD[5]);
end;

var arrD: arrDet;
begin
  assign(arrD[1],'detalle1');
  assign(arrD[2],'detalle2');
  assign(arrD[3],'detalle3');
  assign(arrD[4],'detalle4');
  assign(arrD[5],'detalle5');
  generarMaestro(arrD);
  writeln('Programa termino...'); readln();
end.
