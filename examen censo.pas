program examen1;
uses crt;
var
 distrito, cont_c,cont_d,tot_c,tot_d, 
 mayor_ingreso,i,nro_vivienda, 
 cant_personas,ingreso_mensual,
 tot_personas,
 acum_personas,acum_in,mayor_distrito: Integer;
 opcion: string;

function elejir_tipo_vivienda (): string;
var
 opcion: string;
 begin
 repeat
 writeln('eliga tipo de vivienda [c/d]');
 readln(opcion);
 if (opcion <> 'c') and (opcion <> 'd') then 
 writeln('error de tipeo, vuelva a ingresar');
 until (opcion = 'c') or (opcion = 'd');
 elejir_tipo_vivienda:= opcion;
 end;
 
procedure carga_datos; 
 begin
 mayor_ingreso:= 0;
 tot_c:= 0;
 tot_d:= 0;
 tot_personas:= 0;
 for i:= 1 to 6 do
  begin
  clrscr;
   acum_in:= 0;
   cont_d:= 0;
   cont_c:= 0;
   acum_personas:= 0;
   write('Ingrese NRO de distrito: ');
   ReadLn(distrito);
   Write('Ingrese NRO de vivienda: ');
   ReadLn(nro_vivienda);
   while nro_vivienda <> 0 do
    begin
    if elejir_tipo_vivienda() = 'c' then
     begin        
     write('Cuantas personas viven aqui? ');
     readln(cant_personas);
     cont_c:= cont_c + cant_personas;
     acum_personas:= acum_personas + cant_personas;
     write('Cual es el ingreso mensual?');
     readln(ingreso_mensual);
     acum_in:= acum_in + ingreso_mensual;
     end
    else
     begin
     write('Cuantas personas viven aqui? ');
     readln(cant_personas);
     cont_d:= cont_d + cant_personas;
     acum_personas:= acum_personas + cant_personas;
     write('Cual es el ingreso mensual?');
     readln(ingreso_mensual);    
     acum_in:= acum_in + ingreso_mensual;
     end; 
     write('Ingrese NRO de vivienda: ');
     readln(nro_vivienda);   
  end;  
  tot_personas:= tot_personas + acum_personas;
  tot_c:= tot_c + cont_c;
  tot_d:= tot_d + cont_d;
  if acum_in > mayor_ingreso then
   begin
   mayor_distrito:= distrito;
   mayor_ingreso:= acum_in; 
   end;
end;
end;

procedure mostrar_total_personas;
 begin
 writeln('Total de gente en toda Rosario',tot_personas);
 writeln();
 writeln('pulse cualquier tecla para salir...');
 readln();
 end;

procedure mostrar_c;
begin
writeln('total de personas viviendo en casa: ',tot_c);
writeln();
writeln('pulse cualquier tecla para salir...');
readln();
end;

procedure mostrar_d;
begin
writeln('total de personas viviendo en departamento: ',tot_d);
writeln();
writeln('pulse cualquier tecla para salir...');
readln();
end;

procedure mostrar_total_c_d;
var 
 opcion: integer;
 begin
 repeat 
 clrscr;
 writeln('1. casa');
 writeln('2. departamento');
 writeln('3. regresar al menu principal');
 writeln();
 writeln('seleccione opción:');
 readln(opcion);
 case opcion of
  1: begin
     clrscr;
     mostrar_c;
     end;
  2: begin
     clrscr;
     mostrar_d;
     end;
 end;
 until (opcion = 3);
 end;

procedure mostrar_mayor;
begin
writeln('Distrito con mayor ingreso mensual: ',mayor_distrito);
writeln('Total de ingresos mensuales: ',mayor_ingreso);
writeln();
writeln('pulse cualquier tecla para salir...');
readln();
end;

procedure menu;
var
 opcion: integer; 
 begin
 repeat
 clrscr;
 writeln('1. total de personas en Rosario');
 writeln('2. total de personas segun tipo de vivienda ');
 writeln('3. distrito con mayor ingreso mensual');
 writeln('4. salir');
 writeln();
 writeln('seleccione su opcion: ');
 readln(opcion);
 case opcion of
  1: begin
     clrscr;
     mostrar_total_personas;
     end;
  2: begin
     clrscr;
     mostrar_total_c_d;
     end;
  3: begin
     clrscr;
     mostrar_mayor;
     end;  
 end;  
 until (opcion = 4);
 end;

begin
carga_datos;
clrscr;
menu;
end.

