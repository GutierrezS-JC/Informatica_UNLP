program fodtp3e4;

type
  tTitulo = String[50];
  tArchLibros = file of tTitulo ;

{Abre el archivo y agrega el título del libro, recibido como parámetro
manteniendo la política descripta anteriormente}
procedure agregar (var a: tArchLibros ; titulo: string);
var t: tTitulo; c,nrr: integer;
begin
  seek(a,0);
  if (not eof(a)) then begin
    read(a,t); //cabecera
    Val(t,nrr,c); nrr:= (nrr * -1);
    end
  else begin
    Str(0,t); write(a,t); nrr:= 0;
  end;
  if (nrr > 0) then begin
    seek(a,nrr); read(a,t); Val(t,nrr,c);
    seek(a,filepos(a)-1); t:= titulo; write(a,t);
    Str(nrr,t); seek(a,0); write(a,t); end
  else begin
    t:= titulo; seek(a,filesize(a)); write(a,t);
  end;

end;

procedure listar (var a:tArchLibros);
var t: tTitulo;
begin
  reset(a); if (not eof(a)) then read(a,t);
  while (not eof(a)) do begin
    read(a,t);
    if (Pos('-',t) <> 1) and (t <> '0') then writeln('[',t,']');
  end;
  close(a);
end;

//procedimiento de prueba, no es el punto 5 de esta misma practica
procedure eliminar (var a: tArchLibros; pos: integer);
var t: tTitulo; c,nrr: integer;
begin
  reset(a);
  read(a,t); //cabecera
  val(t,nrr,c);
  seek(a,0);
  Str((pos * -1),t);
  write(a,t); //registro a eliminar
  seek(a,pos);
  Str(nrr,t);
  write(a,t); //valor q tenia cabecera
  close(a);
end;

var a: tArchLibros; t: tTitulo;
begin
  assign(a,'tp3e4.mae');
  rewrite(a);
  agregar(a,'Bases de datos');
  agregar(a,'Matematicas');
  agregar(a,'Fisica');
  agregar(a,'Informatica');
  agregar(a,'Biologia');
  agregar(a,'Deportes');
  agregar(a,'Cuantica');
  close(a);
  listar(a); writeln('---------');
  
  eliminar(a,3);
  eliminar(a,5);
  listar(a); writeln('---------');
  
  reset(a);
  agregar(a,'Cuerdas');
  agregar(a,'Musica');
  agregar(a,'Dimensiones');
  close(a);
  listar(a); writeln('---------');
  writeln('Programa termino...'); readln();
end.