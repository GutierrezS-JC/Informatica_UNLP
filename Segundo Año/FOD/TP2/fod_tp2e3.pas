program fodtp2e3;
const
  valor_alto = 9999;
  cant_detalle = 5;
type
  producto = record
    cod: integer;
    desc: string;
    pre: real;
    stka: integer;
    stkm: integer;
  end;
  pedido = record
    cod: integer;
    cant: integer;
  end;
  maestro = file of producto;
  detalle = file of pedido;
  detArray = array[1..cant_detalle] of detalle;
  regArray = array[1..cant_detalle] of pedido;

procedure leerPedido (var det: detalle; var ped: pedido); begin
  if (not eof(det)) then read (det,ped) else ped.cod := valor_alto;
end;

procedure minimoN (var detArr: detArray; var regArr: regArray; var min: pedido);
var i,m: integer;
begin
  min:= regArr[1]; m:= 0;
  for i:= 2 to cant_detalle do begin
    if (regArr[i].cod <= min.cod) then begin
      min:= regArr[i]; m:= i; 
    end;
  end;
  leerPedido(detArr[m],regArr[m]); 
end;

procedure minimo (var d1,d2,d3,d4: detalle; var r1,r2,r3,r4,m: pedido; var suc: integer);
begin
  if (r1.cod <= r2.cod) and (r1.cod <= r3.cod) and (r1.cod <= r4.cod) then begin
    m:= r1; leerPedido(d1, r1); suc:= 1; end
  else begin
    if (r2.cod <= r3.cod) and (r2.cod <=r4.cod) then begin
      m := r2; leerPedido(d2, r2); suc:= 2; end
    else begin
      if (r3.cod <= r4.cod) then begin
        m := r3; leerPedido(d3, r3); suc:= 3; end
      else begin
        m := r4; leerPedido(d4, r4); suc:= 4;
      end;
    end;
  end;
end;

procedure actualizarMaestro (var mae: maestro; var det1,det2,det3,det4: detalle);
var prod: producto; ped1,ped2,ped3,ped4,min: pedido; sucursal: integer;
begin
  reset(mae); reset(det1); reset(det2); reset(det3); reset(det4);
  leerPedido(det1, ped1); leerPedido(det2, ped2); leerPedido(det3, ped3); leerPedido(det4, ped4);
  minimo (det1,det2,det3,det4,ped1,ped2,ped3,ped4,min,sucursal);
  while (min.cod <> valor_alto) do begin
    read(mae,prod);
    while (prod.cod = min.cod) do begin
      prod.stka:= prod.stka - min.cant;
      if (prod.stka <= prod.stkm) then writeln('** Stock Minimo --- Producto: ', prod.cod);
      if (prod.stka < 0) then begin
        writeln('!! Falta de stock -- Producto: ', prod.cod,' Faltan: ', (prod.stka * -1), ' Sucursal: ', sucursal);
        prod.stka:= 0;
      end;
      minimo (det1,det2,det3,det4,ped1,ped2,ped3,ped4,min,sucursal);
    end;
    seek(mae,filepos(mae)-1); write (mae, prod);
  end;
  close(mae); close(det1); close(det2); close(det3); close(det4);
end;

var mae: maestro; ped1, ped2, ped3, ped4: detalle;
begin
  actualizarMaestro(mae,ped1,ped2,ped3,ped4);
  writeln('Programa termino...');
  readln();
end.
