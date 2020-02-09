program fodtp2e5;

const
  valor_alto = 9999;

type
  producto = record
    cod: integer;
    nom: string;
    prec: real;
    stka: integer;
    stkm: integer;
  end;
  venta = record
    cod: integer;
    cant: integer;
  end;
  maestro = file of producto;
  detalle = file of venta;

procedure crearMaestro (var mae: maestro);
var txt: Text; p: producto;
begin
  assign(mae,'productos.txt'); rewrite(mae); reset(txt);
  while (not eof(txt)) do begin
    with p do readln(txt, cod, prec, stka, stkm, nom);
    write(mae,p);
  end;
  close(mae); close(txt);
end;

procedure listarMaestro (var mae: maestro);
var txt: Text; p: producto;
begin
  assign(txt,'reporte.txt'); rewrite(txt); reset(mae);
  while (not eof(mae)) do begin
    read(mae,p);
    with p do writeln(txt, cod, prec, stka, stkm, nom);
  end;
  close(mae); close(txt);
end;

procedure crearDetalle (var det: detalle);
var txt: Text; var v: venta;
begin
  assign(txt,'ventas.txt'); rewrite(det); reset(txt);
  while (not eof(txt)) do begin
    with v do readln(txt, cod, cant);
    write(det,v);
  end;
  close(det); close(txt);
end;

procedure imprimirDetalle (var det: detalle);
var v: venta;
begin
  reset(det);
  writeln('Listado del archivo detalle:');
  while (not eof(det)) do begin
    read(det,v); writeln('  Codigo producto: ', v.cod, ' Cantidad vendida: ', v.cant);
  end;
  close(det);
end;

procedure leer (var a: detalle; var d: venta); begin
  if (not eof(a)) then read(a,d) else d.cod:= valor_alto;
end;

procedure actualizarMaestro (var mae: maestro; var det: detalle);
var p: producto; v: venta;
begin
  reset(mae); reset(det);
  leer(det,v);
  while (v.cod <> valor_alto) do begin
    read(mae,p);
    while (p.cod = v.cod) do begin
      p.stka:= p.stka - v.cant;
      leer(det,v);
    end;
    seek(mae,filepos(mae)- 1); write(mae,p);
  end;
  close(mae); close(det);
end;

procedure listarStockMinimo (var mae: maestro);
var txt: Text; p: producto;
begin
  assign(txt,'stock_minimo'); rewrite(txt); reset(mae);
  while (not eof(mae)) do begin
    read(mae,p);
    if (p.stka < p.stkm) then writeln(txt, 'Codigo: ', p.cod, ' Nombre: ', p.nom, ' Cantidad: ', p.stka);
  end;
  close(txt); close(mae);
end;

var mae: maestro; det: detalle; opcion: integer;
begin
  assign(mae,'fodtp2e5.mae');
  assign(det,'fodtp2e5.det');
  repeat
    writeln('-----------------------------------------------');
    writeln('1. Crear maestro desde productos.txt');
    writeln('2. Listar maestro en reporte.txt');
    writeln('3. Crear detalle desde ventas.txt');
    writeln('4. Imprimir archivo detalle.');
    writeln('5. Actualizar maestro con detalle');
    writeln('6. Listar productos por debajo del stock minimo en stock_minimo.txt');
    writeln('0. Salir');
    write('Opcion: '); readln(opcion);
    case opcion of
      1: crearMaestro(mae);
      2: listarMaestro(mae);
      3: crearDetalle(det);
      4: imprimirDetalle(det);
      5: actualizarMaestro(mae,det);
      6: listarStockMinimo(mae);
      0: writeln('Saliendo...')
      else writeln('Opcion no valida!');
    end;
  until (opcion = 0);
  writeln('Prpograma termino...'); readln();
end.