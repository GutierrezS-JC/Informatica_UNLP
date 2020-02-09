program fodtp2e13;

const
  valor_alto = -1;
  rapipagos = 9;

type
  registro = record
    dni: integer;
    codca: integer;
    monto: real;
  end;
  archivo = file of registro;
  arrayReg = array [1..rapipagos] of registro;
  arrayDet = array [1..rapipagos] of archivo;

procedure leer (var a: archivo; r: registro); begin
  if (not eof(a)) then read(a,r) else r.codca:= valor_alto;
end;

procedure minimo (var aDet: arrayDet; var aReg: arrayReg; m: registro);
var i,r: integer;
begin
  m:= aReg[1]; r:= 0;
  for i:= 2 to rapipagos do begin
    if ((aReg[i].dni <= m.dni) or ((aReg[i].dni = m.dni) and (aReg[i].codca <= m.codca))) then begin
      r:= i; m:= aReg[r];
    end;
  end;
  if (r > 0) then leer(aDet[r],aReg[r]);
end;

procedure actualizar (var am: archivo; var aDet: arrayDet);
var rm,min; regsitro; aReg: arrayReg; ccdni,cccodca,i: integer; monto: real;
begin
  reset(am); read(am,rm);
  for i:= 1 to rapipagos do begin
    reset(aDet[i]); leer(aDer[i],aReg[i]);
  end;

  minimo(aDet,aReg,min);
  
  while (min.codca <> valor_alto) do begin
    while ((rm.dni <> min.dni) and (rm.codca <> min.codca)) do read(am,rm);
    ccdni:= min.dni; cccodca:= min.codca; monto:= 0;
    while (ccdni = min.dni) and (cccodca = min.codca) do begin
      monto:= monto + min.monto;
      minimo(aDet,aReg,min);
    end;
    rm.monto:= rm.monto + monto;
    seek(am,filepos(am)-1); write(am,rm);
  end;
    
  close(am);
  for i:= 1 to rapipagos do close(aDet[i]);
end;

procedure exportar (var am: archivo);
var txt: Text; var rm: registro; 
begin
  assign(txt,'tp2e13.txt');
  rewrite(txt); reset(am);
  writeln(txt,'DNI -- Catedra -- Estado');
  while (not eof(am)) do begin
    read(am,rm);
    if (rm.monto = 0) then writeln(txt,rm.dni,' ',rm.codca,' alumno moroso');
  end;
  close(txt); close(am);
end;

var am: archivo; aDet: arrayDet; aReg: arrayReg;
begin
  assign(am,'tp2e13.mae');
  //assign de los n archivos detalle
  //assign (aDet[1],'tp2e13-1.det');
  //assign (aDet[2],'tp2e13-2.det');
  //... n = rapipagos
  //assign (aDet[n],'tp2e13-n.det');
end.