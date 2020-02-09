program fodtp2e8;

const
  valor_alto = -1
  
type
  cateR = 1..15;
  empleado = record
    depto: string;
    divi: string;
    num: integer;
    cate: cateR;
    horas: real;
  end;
  categorias = array[cateR] of real;
  archivo = file of empleado;

procedure cargarCate (var c: categorias);
var txt: Text; i, categ: cateR; valor: real;
begin
  assign(txt,'categorias.txt');
  reset(txt);
  for i:= 1 to 15 do begin
    readln(txt, categ, valor);
    c[categ]:= valor;
  end;
end;

procedure leer (var a: archivo; var r: empleado); begin
  if (not eof(a)) then read(a,r) else r.num:= valor_alto;
end;

procedure informar (var mae: archivo; categs: categorias);
var e: empleado; depto, divi: string; num: integer;
  horasEmp, horasDiv, horasDep, totEmp, totDiv, totDep: real;
begin
  reset(mae);
  leer(mae,e);
  while (e.num <> valor_alto) do begin
    depto:= e.depto; horasDep:= 0; totDep:= 0;
    writeln('Departamento: ', depto);
    while (e.depto = depto) do begin
      divi:= e.divi; horasDiv:= 0; totDiv:= 0;
      writeln('Division: ', divi);
      writeln('Numero de empleado   Total de Hs.   Importe a cobrar');
      while (e.depto = depto) and (e.divi = divi) do begin
        num:= e.num; horasEmp:= 0; totEmp:= 0;
        while (e.depto = depto) and (e.divi = divi) and (e.num = num) do begin
          horasEmp:= horasEmp + e.horas;
          leer(mae,e);
        end;
        totEmp:= (categs[e.cate] * horasEmp);
        totDiv:= totDiv + totEmp; 
        horasDiv:= horasDiv + horasEmp;
        writeln(num,'        ',horasEmp:0:2,'        ',totEmp:0:2);
      end;
      writeln('Total de horas division: ', horasDiv:0:2);
      writeln('Monto total por division: ', totDiv:0:2);
      totDep:= totDep + totDiv;
      horasDep:= horasDep + horasDiv;
    end;
    writeln('Total horas departamento: ', horasDep:0:2);
    writeln('Monto total departamento: ', totDep:0:2);
  end;
  close(mae);
end;

var mae: archivo; categs: categorias;
begin
  cargarCate(categs);
  assign(mae,'fodtp2e8.mae');
  informar(mae,categs);
  writeln('Prpograma termino...'); readln();
end.   