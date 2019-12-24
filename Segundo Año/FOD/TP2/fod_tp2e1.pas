program tp2e1;

type
  empleado = record
    cod: integer;
    nom: string;
    mon: real;
  end;

  archivo: file of empleado;

procedure compactar (var orig, dest: archivo);
var empO, empD: empleado;
begin
  reset(orig); rewrite(dest);
  if (not eof(orig)) then read(orig, empO);
  while (not eof(orig)); do begin
    empD:= empO
    empD.mon:= 0;
    while (empO.cod = empD.cod) do begin
      empD.mon:= empD.mon + empO.mon;
      read(orig, empO);
    end;
    write(dest,empD);
  end;  
  close(orig); close(dest);
end;

var archO, archD: archivo;
begin
  assign(archO, 'tp2e1-O.reg');
  assign(archD, 'tp2e1-D.reg');
  compactar(archO, archD);
end. 