program fodtp2e9;

const
  valor_alto = -1;

type
  datos = record
    prov: string;
    alfa: integer;
    encu: integer;
  end;
  censo = record
    prov: string;
    loc: integer;
    alfa: integer;
    encu: integer;
  end;
  maestro = file of datos;
  detalle = file of censo;

procedure leerDet (var a: detalle; var r: censo); begin
  if (not eof(a)) then read(a,r) else r.alfa:= valor_alto;
end;
procedure leerMae (var a: maestro; var r: datos); begin
  if (not eof(a)) then read(a,r) else r.alfa:= valor_alto;
end;

procedure minimo (var d1,d2: detalle; var r1,r2,m: censo); begin
  if (r1.prov <= r2.prov) then begin
    m := r1; leerDet(d1, r1); end
  else begin
    m := r2; leerDet(d2, r2);
  end;
end;

procedure merge (var mae: maestro; var det1, det2: detalle);
var d: datos; var c1,c2,m: censo; prov: string; loc, alfaP, encuP: integer;
begin
  reset(mae); reset(det1); reset(det2);
  leerMae(mae,d); leerDet(det1,c1); leerDet(det2,c2);
  minimo (det1,det2,c1,c2,m);
  while (m.alfa <> valor_alto) do begin
    alfaP:= 0; encuP:= 0;
    if (d.prov = m.prov) then begin
      prov:= m.prov;
      loc:= m.loc; alfaP:= 0; encuP:= 0;
      while (m.prov = prov) do begin
        alfaP:= alfaP + m.alfa;
        encuP:= encuP + m.encu;
        minimo (det1,det2,c1,c2,m);
      end;
      d.alfa:= alfaP; d.encu:= encuP;
      seek(mae,filepos(mae)-1); write(mae,d);
    end;
    leerMae(mae,d);
  end;
  close(mae); close(det1); close(det2);
end;

var m: maestro; d1,d2: detalle;
begin
  assign(m, 'fodtp2e9.mae');
  assign(d1, 'fodtp2e9.det1');
  assign(d2, 'fodtp2e9.det2');
  merge(m,d1,d2);
  writeln('Prpograma termino...'); readln();
end.