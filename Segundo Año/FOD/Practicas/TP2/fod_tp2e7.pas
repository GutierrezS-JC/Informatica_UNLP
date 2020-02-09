program fodtp2e7;

const
  valor_alto = 9999;

type
  voto = record
    prov,loc,mesa,cant: integer;
  end;
  archivo = file of voto;

procedure leer (var a: archivo; var r: voto); begin
  if (not eof(a)) then read(a,r) else r.prov:= valor_alto;
end;

procedure imprimirInforme (var mae: archivo);
var v: voto; codp, codl, cantL, cantP, total: integer;
begin
  reset(mae); leer(mae,v);
  while (v.prov <> valor_alto) do begin
    codp:= v.prov; cantP:= 0;
    writeln('Codigo de provincia: ', codp);
    writeln('Codigo de localidad',chr(9),'Total de votos');
    while (v.prov = codp) do begin
      codl:= v.loc; cantL:= 0;
      while (v.prov = codp) and (v.loc = codl) do begin
        cantL:= cantL + v.cant;
        leer(mae,v);
      end;
      writeln(codl,chr(9),chr(9),cantL);
      cantP:= cantP + cantL; 
    end;
    writeln('Total votos de provincia: ', cantP); writeln();
    total:= total + cantP;
  end;
  writeln('Total general de votos: ', total);
  close(mae);
end;

var mae: archivo;
begin
  assign(mae,'fodtp2e7.mae');
  imprimirInforme(mae);
  writeln('Prpograma termino...'); readln();
end.
