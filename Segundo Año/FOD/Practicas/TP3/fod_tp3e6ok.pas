program tp3e6ok;

const
  valor_alto = -1;

type
  registro = record
    cod: integer;
    desc: string;
    color: string;
    tipo: string;
    stock: integer;
    precio: real;
  end;
  maestro = file of registro;
  detalle = file of integer;

procedure leerm(var a: maestro; var r: registro); begin
  if (not eof(a)) then read(a,r) else r.cod:= valor_alto;
end;
procedure leerd(var a: detalle; var r: integer); begin
  if (not eof(a)) then read(a,r) else r:= valor_alto;
end;

procedure bajalogica (var m: maestro; var d: detalle);
var reg: registro; cod: integer;
begin
  seek(m,0); leerm(m,reg);
  seek(d,0); leerd(d,cod);
  while (cod <> valor_alto) do begin
    while (reg.cod <> cod) do leerm(m,reg);
    if (reg.cod = cod) then begin
      if (reg.stock = 0) then reg.stock:= -1 else reg.stock:= reg.stock * -1;
      seek(m,filepos(m) - 1); write(m,reg);
    end;
    seek(m,0); leerm(m,reg);
    leerd(d,cod);
  end;
end;

procedure bajafisica (var m: maestro);
var reg, fin: registro; posi, posf: integer;
begin
  posi:= 0; posf:= filesize(m) - 1;
  seek(m,0);
  while (posi < posf) do begin
    leerm(m,reg);
    if (reg.stock < 0) then begin
      seek(m,posf); read(m,fin);
      while ((posf > posi) and (fin.stock < 0)) do begin
        posf:= posf - 1;
        seek(m,posf); read(m,fin);
      end;
      if ((posf > posi) and (fin.stock >= 0)) then begin
        seek(m,posi); write(m,fin);
        seek(m,posf); write(m,reg);
        posi:= posi + 1;
        seek(m,posi);
        posf:= posf - 1;
      end; end
    else begin
      posi:= posi + 1;
    end;
  end;
  seek(m,posi + 1);
  truncate(m);
end;

procedure crear (var m: maestro; var d: detalle);
var r: registro; i: integer;
begin
  randomize;
  rewrite(m); rewrite(d);
  with r do begin
    cod:= 8; desc:= 'prenda8'; color:= 'color'; tipo:= 'tipo'; stock:= 87; precio:= 300; write(m,r);
    cod:= 2; desc:= 'prenda2'; color:= 'color'; tipo:= 'tipo'; stock:= 21; precio:= 300; write(m,r);
    cod:= 6; desc:= 'prenda6'; color:= 'color'; tipo:= 'tipo'; stock:= 65; precio:= 300; write(m,r);
    cod:= 3; desc:= 'prenda3'; color:= 'color'; tipo:= 'tipo'; stock:= 32; precio:= 300; write(m,r);
    cod:= 4; desc:= 'prenda4'; color:= 'color'; tipo:= 'tipo'; stock:= 43; precio:= 300; write(m,r);
    cod:= 1; desc:= 'prenda1'; color:= 'color'; tipo:= 'tipo'; stock:= 0; precio:= 300; write(m,r);
    cod:= 7; desc:= 'prenda7'; color:= 'color'; tipo:= 'tipo'; stock:= 76; precio:= 300; write(m,r);
    cod:= 9; desc:= 'prenda9'; color:= 'color'; tipo:= 'tipo'; stock:= 98; precio:= 300; write(m,r);
    cod:= 5; desc:= 'prenda5'; color:= 'color'; tipo:= 'tipo'; stock:= 54; precio:= 300; write(m,r);
  end;
  write(d,6);
  write(d,1);
  close(m); close(d);
end;

procedure vercontenidomaestro (var m: maestro);
var r: registro;
begin
  seek(m,0); leerm(m,r);
  while (r.cod <> valor_alto) do begin
    writeln(' Cod=',r.cod,' Color=',r.color,' Tipo=',r.tipo,' Stock=',r.stock,' Precio=',r.precio:0:2);
    leerm(m,r);
  end;
end;
procedure vercontenidodetalle (var d: detalle);
var cod: integer;
begin
  seek(d,0); leerd(d,cod);
  while (cod <> valor_alto) do begin
    writeln(' Cod=',cod);
    leerd(d,cod);
  end;
end;

var m: maestro; d: detalle;
begin
  assign(m,'fodtp3e6ok.mae');
  assign(d,'fodtp3e6ok.det');
  crear(m,d);

  reset(m); reset(d);
  
  writeln('Contenido del archivo maestro:'); vercontenidomaestro(m);
  writeln('Contenido del archivo detalle:'); vercontenidodetalle(d);
  
  writeln('Realizando baja logica...'); bajalogica(m,d);
  writeln('Contenido del archivo maestro:'); vercontenidomaestro(m);
  
  writeln('Realizando baja fisica...'); bajafisica(m);
  writeln('Contenido del archivo maestro:'); vercontenidomaestro(m);
  
  close(m); close(d);
  writeln('Programa termino...'); readln();
end.
