PROGRAM console;
{$mode objfpc}{$H+}

USES
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads, cmem
  {$ENDIF}{$ENDIF}
  PolinD, VectorD, MatrizD, Interfaces, Dialogs, sysutils;

VAR
    M,M2,M3: cls_Matriz;
    V, V2: cls_vector;

    pol_n, divi,coc,rest, B,C: cls_polin;
    i: integer;
    k:extended;
BEGIN
   pol_N:= cls_Polin.Crear(3);
   //pol_N.Coef.cells[4]:= 4;
   pol_N.Coef.cells[3]:= 1;
   pol_N.Coef.cells[2]:= 1;
   pol_N.Coef.cells[1]:= 1;
   pol_N.Coef.cells[0]:= 13.32;
   pol_n.Coef.mostrar('Coef: ');
//   pol_N.Raices.cells[0,0]:= -1.23332;
//   pol_N.Raices.cells[0,1]:= -1.23332;
//   pol_N.Raices.cells[0,2]:= -543;
//
//   pol_N.Raices.cells[1,0]:= 3.1466;
//   pol_N.Raices.cells[1,1]:= -3.1466;
//   pol_N.Raices.cells[1,2]:= 0;

   Pol_N.bairstow(0.000001,0,0);

   Pol_N.Raices.Mostrar('<<- Raices ->>');
   Writeln('Raices: ',Pol_N.Raices_To_String(0));
  readln;
END.
