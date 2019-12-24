program fodtp3e2;

type
  registro = record
    cod: integer;
    nom, ape, dir, tel: string;
    dni: integer;
    fnac: string;
  end;
  archivo = file of registro;

procedure darDeBaja (var a: archivo; dni: integer);
var r: registro; pos: integer;
begin
  reset(a);
  while(not eof(a)) do begin
    read(a,r);
    if (r.dni < dni) then begin
      r.dni:= r.dni * -1;
      seek(a,filepos(a)-1); write(a,r);
    end;
  end;
  close(a);
end;

procedure leerRegistro (var r: registro);
begin
  write('Codigo (<=0: terminar): '); readln(r.cod); if (r.cod > 0) then begin
  write('Nombre: '); readln(r.nom);
  write('Apellido: '); readln(r.ape);
  write('Direccion: '); readln(r.dir);
  write('Telefono: '); readln(r.tel);
  write('DNI: '); readln(r.dni);
  write('Fecha nacimiento: '); readln(r.fnac);
  end;
end;

procedure crearMaestro(var a: archivo);
var r: registro;
begin
  rewrite(a);
  leerPersona(r);
  while (r.cod > 0) do begin
    write(a,r); leerPersona(r);
  end;
  close(a);
end;  

var a: archivo;
begin
  assign(a,'tp3e2.mae');
  crearMaestro(a);
  dardebaja(a,5000000);
  write('Programa termino...'); readln();
end.  