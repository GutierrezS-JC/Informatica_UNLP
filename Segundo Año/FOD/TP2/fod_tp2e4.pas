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
  
procedure leer (var det: archivo; var reg: registro); begin
  if (not eof(det)) then read(det,reg) else reg.cod:= valor_alto;
end;
procedure minimo (var d1,d2,d3,d4,d5: archivo; var r1,r2,r3,r4,r5,m: registro);
begin
  if (r1.cod <= r2.cod) and (r1.cod <= r3.cod) and (r1.cod <= r4.cod) and (r1.cod <= r5.cod) then begin
    m:= r1; leer(d1, r1); end
  else begin
    if (r2.cod <= r3.cod) and (r2.cod <=r4.cod) and (r2.cod <=r5.cod) then begin
      m := r2; leer(d2, r2); end
    else begin
      if (r3.cod <= r4.cod) and (r3.cod <=r5.cod) then begin
        m := r3; leer(d3, r3); end
      else begin
        if (r4.cod <= r5.cod) then begin
          m := r4; leer(d4, r4); end
        else begin
          m := r5; leer(d5, r5);
        end;
      end;
    end;
  end;
end;

procedure generarMaestro (var det1,det2,det3,det4,det5: archivo);
var mae: archivo; regm,reg1,reg2,reg3,reg4,reg5,min: registro;
begin
  assign(mae,'var\log');
  rewrite(mae); reset(det1); reset(det2); reset(det3); reset(det4); reset(det5);

  leer(det1,reg1); leer(det2,reg2); leer(det3,reg3); leer(det4,reg4); leer(det5,reg5);
  minimo(det1,det2,det3,det4,det5,reg1,reg2,reg3,reg4,reg5,min);
  while (min.cod <> valor_alto) do begin
    regm.cod:= min.cod;
    while (regm.cod = min.cod) do begin
      regm.fecha = min.fecha; regm.total:= 0;
      while (regm.cod = min.cod) and (regm.fecha = min.fecha) do begin
        regm.total:=  regm.total + min.total;
        minimo(det1,det2,det3,det4,det5,reg1,reg2,reg3,reg4,reg5,min);
      end;
      write(mae,regm);
    end;
  end;

  close(mae); close(det1); close(det2); close(det3); close(det4); close(det5);
end;

var det1,det2,det3,det4,det5: archivo;
begin
  generarMaestro(det1,det2,det3,det4,det5);
  writeln('Programa termino...'); readln();
end.