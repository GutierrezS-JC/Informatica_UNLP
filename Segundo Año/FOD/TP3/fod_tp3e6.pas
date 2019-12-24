program fodtp3e6;

const
  valor_alto = -1;

type
  registro = record
    cod: integer;
    des: string;
    col: string;
    tip: string;
    stk: integer;
    pre: real;
  end;
  maestro = file of registro;
  detalle = file of integer;

procedure leer (var a: detalle; var r: integer); begin
  if (not eof(a)) then read(a,r) else r:= valor_alto;
end;

procedure BajaLogica (var m: maestro; var d: detalle);
var rm: registro; cod: integer;
begin
  seek(m,0); seek(d,0);
  read(m,rm); leer(d,cod);
  while (cod <> valor_alto) do begin
    while (rm.cod <> cod) do read(m,rm);
    rm.stk:= (rm.stk * -1);
    seek(m,filepos(m)-1); write(m,rm);
    seek(m,1); read(m,rm);
    leer(d,cod);
  end;
end;

procedure BajaFisica (var m: maestro);
var rm: registro; actual, ultimo: integer;
begin
  seek(m,0);
  actual:= filepos(m);  // actual:= 0;
  ultimo:= filesize(m)-1;
  rm.cod:= 0;
  while (not eof(m)) and (rm.cod > -1) and (actual <= ultimo) do begin
    read(m,rm);
    if (rm.stk < 0) and (rm.cod > -1) then begin
      seek(m,ultimo);
      read(m,rm);
      while (rm.stk < 0) and (actual < ultimo) do begin
        ultimo:= ultimo - 1;
        seek(m,ultimo); read(m,rm);
      end;
      if (rm.stk >= 0) and (actual < ultimo) then begin
        seek(m,actual); write(m,rm);
        rm.cod:= (rm.cod * -1);
        seek(m,ultimo); write(m,rm);
        ultimo:= ultimo -1; seek(m,actual+1);
        rm.cod:= 0;
      end;
    end;
    actual:= filepos(m);
  end;
  truncate(m);
end;
//Eliminar codigos: 6, 1
//                      -     -
//Lista de Codigos: 8,2,6,3,4,1,7,9,5
//             pos: 0,1,2,3,4,5,6,7,8
//          actual: 7
//          ultimo: 6
//          estado: 8,2,5,3,4,9,7,-9,-5

procedure crear (var m: maestro; var d: detalle);
var r: registro; i: integer;
begin
  randomize;
  rewrite(m);
  with r do begin
    cod:= 8; des:= 'prenda8'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 2; des:= 'prenda2'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 6; des:= 'prenda6'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 3; des:= 'prenda3'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 4; des:= 'prenda4'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 1; des:= 'prenda1'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 7; des:= 'prenda7'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 9; des:= 'prenda9'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
    cod:= 5; des:= 'prenda5'; col:= 'color'; tip:= 'tipo'; stk:= random(40); pre:= 300; write(m,r);
  end;
  close(m);
  rewrite(d);
  write(d,6);
  write(d,1);
  close(d);
end;

procedure listar (var m: maestro);
var r: registro;
begin
  seek(m,0);
  while (not eof(m)) do begin
    read(m,r);
    with r do writeln(cod, ',', des, ',', col, ',', tip, ',', stk, ',', pre:0:2);
  end;
end;

var mae: maestro; det: detalle;
begin
  assign(mae,'fodtp3e6.mae');
  assign(det,'fodtp3e6.det');

  crear(mae,det);
  
  reset(mae); reset(det);
  writeln('Eliminar codigo 6 y 1'); writeln('-----------------------------------------------------');
  
  BajaLogica(mae,det);   listar(mae); writeln('-----------------------------------------------------');
  BajaFisica(mae);       listar(mae); writeln('-----------------------------------------------------');
  close(mae); close(det);
  
  writeln('Programa termino...'); readln();
end.