program fodtp2e14;

const
  valor_alto = -1;
  detalles = 100;

type
  semanario = record
    fecha: string;
    cod: integer;
    nom: string;
    desc: string;
    prec: real;
    cant: integer;
    sold: integer;
  end;
  venta = record
    fecha: string;
    cod: integer;
    cant: integer;
  end;
  archivoM = file of semanario;
  archivoD = file of venta;
  arrayReg = array [1..detalles] of venta;
  arrayDet = array [1..detalles] of archivoD;

procedure leer(var a: archivo; var r: venta); begin
  if (not eof(a)) then read(a,r) else r.cod:= valor_alto;
end;

procedure minimo (var aDet: arrayDet; var aReg: arrayReg; var min: venta);
var i,r: integer;
begin
  min:= aReg[1]; r:= 0;
  for i:= 2 to detalles do begin
    if ((aReg[i].fecha < m.fecha) or ((aReg[i].fecha = m.fecha) and (aReg[i].cod < m.cod)) then begin
      r:= i; min:= aReg[i];
    end;
  end;
  if (r > 0) then leer(aDet[r],aReg[r]);
end;

procedure actualizar (var am: archivoM; var aDet: arrayDet);
var rm: semanario; min: venta; aReg: arrayReg; vent,cccod,i: integer; ccfecha: string;
  mas,menos: semanario;
begin
  reset(am); for i:= 1 to detalles do begin reset(aDet[i]); leer(aDet[i],aReg[i]); end;

  read(am,rm); minimo(aDet,aReg,min); mas:= rm; menos:= rm;
  while (min.cod <> valor_alto) do begin
    while (rm.fecha <> min.fecha) and (rm.cod <> min.cod) do read(am,rm);
    ccfecha:= min.fecha; cccod:= min.cod; vent:= 0;
    while (ccfecha = min.fecha) and (ccod = min.cod) do begin
      vent:= vent + 1; minimo(aDet,aReg,min);
    end;
    rm.sold:= rm.sold + vent;
    seek(am,filepos(am)-1); write(am,rm);
    if (mas.sold < rm.sold) then mas:= rm;
    if (menos.sold > rm.sold) then menos:= rm;
  end;
  
  close(am); for i:= 1 to detalles do close(aDet[i]);
  writeln('El semanario mas vendido es  : ',mas.nom, ' fecha: ',mas.fecha);
  writeln('El semanario menos vendido es: ',menos.nom, ' fecha: ',menos.fecha);
end;

var am: archivoM; aDet: arrayDet; x: integer;
begin
  assign(am,'tp2e14.mae');
  for x:= 1 to detalles do assign(aDet[x], 'tp2e14-x.det');
  actualizar(am,aDet);
end.
